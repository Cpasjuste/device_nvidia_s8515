/*
 * Copyright (C) 2008 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "lights"

#include <cutils/log.h>

#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>


#include <sys/ioctl.h>
#include <sys/stat.h>
#include <sys/types.h>

#include <hardware/lights.h>
#include <hardware/hardware.h>

#include <private/android_filesystem_config.h>

#define BLINK_LIMIT_MS 10
#define SYS_PATH_BL_BRIGHTNESS "/sys/class/backlight/pwm-backlight/brightness"
#define SYS_PATH_LED_BRIGHTNESS "/sys/class/leds/roth-led/brightness"
#define SYS_PATH_LED_TRIGGER "/sys/class/leds/roth-led/trigger"
#define SYS_PATH_LED_ON "/sys/class/leds/roth-led/delay_on"
#define SYS_PATH_LED_OFF "/sys/class/leds/roth-led/delay_off"
#define TRY_TIMES 3
#define LED_BREATHE_PROP "persist.sys.NV_LED_BREATHE"

static pthread_mutex_t g_lock = PTHREAD_MUTEX_INITIALIZER;
static int THOR_BRIGHTNESS = 255;
static int THOR_ON = 500;
static int THOR_OFF = 500;
static int blink_led(int ontime, int offtime);

static void set_property_int(char const *key, int value)
{
    char val[32];
    int status;

    snprintf(val, sizeof(val), "%d", value);
    status = property_set(key, val);

    if (status) {
        ALOGE("Error writing to property: %s\n", key);
    }
}

static int write_int(char const *path, int value)
{
    int fd;
    static int already_warned = -1;
    fd = open(path, O_RDWR);
    if (fd >= 0) {
        char buffer[20];
        int bytes = sprintf(buffer, "%d\n", value);
        int amt = write(fd, buffer, bytes);
        close(fd);
        return amt == -1 ? -errno : 0;
    } else {
        if (already_warned == -1) {
            ALOGE("write_int failed to open %s\n", path);
            already_warned = 1;
        }
        return -errno;
    }
}

static int write_string(char const *path, char const *str)
{
    int fd;
    static int already_warned = -1;
    int bytes = strlen(str);
    fd = open(path, O_RDWR);
    if (fd >= 0) {
        int amt = write(fd, str, bytes);
        close(fd);
        return amt == -1 ? -errno : 0;
    } else {
        if (already_warned == -1) {
            ALOGE("write_string failed to open %s\n", path);
            already_warned = 1;
        }
        return -errno;
    }
}

static int read_string(char const *path, char *str, int n)
{
    int fd;
    static int already_warned = -1;
    fd = open(path, O_RDONLY | O_NONBLOCK);
    if (fd >= 0) {
        int amt = read(fd, str, n);
        close(fd);
        return amt == -1 ? -errno : 0;
    } else {
        if (already_warned == -1) {
            ALOGE("read_string failed to open %s\n", path);
            already_warned = 1;
        }
        return -errno;
    }
}

static int rgb_to_brightness(struct light_state_t const *state)
{
    int color = state->color & 0x00ffffff;
    return ((77 * ((color >> 16) & 0x00ff))
        + (150 * ((color >> 8) & 0x00ff)) +
        (29 * (color & 0x00ff))) >> 8;
}

static int set_light_backlight(struct light_device_t *dev,
        struct light_state_t const *state)
{
    int err = 0;
    int brightness = rgb_to_brightness(state);

    pthread_mutex_lock(&g_lock);
    err = write_int(SYS_PATH_BL_BRIGHTNESS, brightness);
    pthread_mutex_unlock(&g_lock);

    return err;
}

static int set_light_notifications(struct light_device_t *dev,
            struct light_state_t const *state)
{
    struct stat sbuf;
    int err = 0;
    int i = 0;
    int mode = state->flashMode;
    int on = state->flashOnMS;
    int off = state->flashOffMS;
    int brightness = rgb_to_brightness(state);

    if (on < BLINK_LIMIT_MS)
        on = BLINK_LIMIT_MS;
    if (off < BLINK_LIMIT_MS)
        off = BLINK_LIMIT_MS;

    pthread_mutex_lock(&g_lock);

    if (mode == LIGHT_FLASH_NONE) {
        err = write_string(SYS_PATH_LED_TRIGGER, "none");
    } else if (mode == LIGHT_FLASH_TIMED) {
        if (state->brightnessMode == BRIGHTNESS_MODE_USER)
            err = write_int(SYS_PATH_LED_BRIGHTNESS, brightness);
        err |= blink_led(on, off);
    } else { 
        pthread_mutex_unlock(&g_lock);
        return -EINVAL;
    }
    pthread_mutex_unlock(&g_lock);
    return err;
}


static int set_light_thor(struct light_device_t *dev,
            struct light_state_t const *state)
{
    struct stat sbuf;
    int err = 0;
    int i = 0;
    int mode = state->flashMode;
    int on = state->flashOnMS;
    int off = state->flashOffMS;
    int brightness = rgb_to_brightness(state);

    if (on < BLINK_LIMIT_MS)
        on = BLINK_LIMIT_MS;
    if (off < BLINK_LIMIT_MS)
        off = BLINK_LIMIT_MS;

    pthread_mutex_lock(&g_lock);
    if (mode == LIGHT_FLASH_NONE) {
        err = write_string(SYS_PATH_LED_TRIGGER, "none");
        err |= write_int(SYS_PATH_LED_BRIGHTNESS, brightness);
    } else if (mode == LIGHT_FLASH_TIMED) {
        err |= blink_led(on, off);
        err |= write_int(SYS_PATH_LED_BRIGHTNESS, brightness);
    } else if (mode == LIGHT_BREATHE_ON) {
        set_property_int(LED_BREATHE_PROP, 1);
    } else if (mode == LIGHT_BREATHE_OFF) {
        set_property_int(LED_BREATHE_PROP, 0);
    } else {
        pthread_mutex_unlock(&g_lock);
        return -EINVAL;
    }
    pthread_mutex_unlock(&g_lock);
    return err;
}

/** Close the lights device */
static int close_lights(struct light_device_t *dev)
{
    if (dev)
        free(dev);
    return 0;
}

static int blink_led(int ontime, int offtime)
{
    int err;
    int i = 0;
    struct stat sbuf;
    err = write_string(SYS_PATH_LED_TRIGGER, "timer");
    while (i < TRY_TIMES) {
        usleep(20000);
        if (stat(SYS_PATH_LED_ON, &sbuf)) {
            i++;
            continue;
        }
        if (sbuf.st_uid != AID_SYSTEM) {
            i++;
            continue;
        }
        if (stat(SYS_PATH_LED_OFF, &sbuf)) {
            i++;
            continue;
        }
        if (sbuf.st_uid != AID_SYSTEM) {
            i++;
            continue;
        }
        if (ontime != 500)
            err |= write_int(SYS_PATH_LED_ON, ontime);
        if (offtime != 500)
            err |= write_int(SYS_PATH_LED_OFF, offtime);
        break;
    }
    return err;
}


/** Open a new instance of a lights device using name */
static int open_lights(const struct hw_module_t *module, char const *name,
        struct hw_device_t **device)
{
    int (*set_light) (struct light_device_t *dev,
            struct light_state_t const *state);

    pthread_mutex_init(&g_lock, NULL);

    if (0 == strcmp(LIGHT_ID_BACKLIGHT, name))
        set_light = set_light_backlight;
    else if (0 == strcmp(LIGHT_ID_THOR, name))
        set_light = set_light_thor;
    else
        return -EINVAL;


    struct light_device_t *dev = malloc(sizeof(struct light_device_t));
    memset(dev, 0, sizeof(*dev));

    dev->common.tag = HARDWARE_DEVICE_TAG;
    dev->common.version = 0;
    dev->common.module = (struct hw_module_t *)module;
    dev->common.close = (int (*)(struct hw_device_t *))close_lights;
    dev->set_light = set_light;

    *device = (struct hw_device_t *)dev;

    return 0;
}

static struct hw_module_methods_t lights_methods =
{
    .open =  open_lights,
};

/*
 * The backlight Module
 */
struct hw_module_t HAL_MODULE_INFO_SYM =
{
    .tag = HARDWARE_MODULE_TAG,
    .version_major = 1,
    .version_minor = 0,
    .id = LIGHTS_HARDWARE_MODULE_ID,
    .name = "NVIDIA Roth lights module",
    .author = "NVIDIA",
    .methods = &lights_methods,
};
