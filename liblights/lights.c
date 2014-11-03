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


#define LOG_NDEBUG 0
#define LOG_TAG "lights"

#include <cutils/log.h>
#include <cutils/properties.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>

#include <sys/ioctl.h>
#include <sys/types.h>

#include <hardware/lights.h>

/******************************************************************************/

static pthread_once_t g_init = PTHREAD_ONCE_INIT;
static pthread_mutex_t g_lock = PTHREAD_MUTEX_INITIALIZER;

static struct light_state_t g_notification;
static struct light_state_t g_battery;
static struct light_state_t g_attention;

char const*const LCD_FILE
        = "/sys/class/backlight/pwm-backlight/brightness";

char const*const RED_LED_FILE
        = "/sys/class/leds/red-green/brightness";

char const*const RED_LED_TRIGGER_FILE
        = "/sys/class/leds/red-green/trigger";

char const*const RED_LED_DELAY_ON_FILE
        = "/sys/class/leds/red-green/device/onms";

char const*const RED_LED_DELAY_OFF_FILE
        = "/sys/class/leds/red-green/device/offms";

char const*const BUTTON_FILE
        = "/sys/class/leds/button1/brightness";

enum STATE_TYPE {
	BATTERY_STATE,
	NOTIFICATION_STATE,
	ATTENTION_STATE
};

enum LED_STATE {
	OFF,
	ON,
	BLINK,
};

#define TIMER "timer"
#define HEARTBEAT "heartbeat"
#define BATTERY_CHARGING "battery-charging"
#define BATTERY_CHARGING_OR_FULL "battery-charging-or-full"
#define BATTERY_FULL "battery-full"
#define BATTERY_CHARGING_BLINK_FULL_SOLID "battery-charging-blink-full-solid"
#define NONE "none"

#define MAX_BUTTON_BRIGHTNESS 3

/**
 * device methods
 */

void init_globals(void)
{
    // init the mutex
    pthread_mutex_init(&g_lock, NULL);
}

static int
write_int(char const* path, int value)
{
    int fd;
    static int already_warned = 0;

    fd = open(path, O_RDWR);
    if (fd >= 0) {
        char buffer[20];
        int bytes = sprintf(buffer, "%d\n", value);

        //ALOGD("write_int %s %s", path, buffer);

        int amt = write(fd, buffer, bytes);
        close(fd);
        return amt == -1 ? -errno : 0;
    } else {
        if (already_warned == 0) {
            ALOGE("write_int failed to open %s\n", path);
            already_warned = 1;
        }
        return -errno;
    }
}

static int
write_string(char const* path, char* str)
{
    int fd;
    static int already_warned = 0;

    fd = open(path, O_RDWR);
    if (fd >= 0) {
       // ALOGD("write_string %s %s", path, str);

    	int amt = write(fd, str, strlen(str));
        close(fd);
        return amt == -1 ? -errno : 0;
    } else {
        if (already_warned == 0) {
            ALOGE("write_string failed to open %s\n", path);
            already_warned = 1;
        }
        return -errno;
    }
}

static int
is_lit(struct light_state_t const* state)
{
    return state->color & 0x00ffffff;
}

static int
rgb_to_brightness(struct light_state_t const* state)
{
    int color = state->color & 0x00ffffff;
    return ((77*((color>>16)&0x00ff))
            + (150*((color>>8)&0x00ff)) + (29*(color&0x00ff))) >> 8;
}

static int
set_light_buttons(struct light_device_t* dev,
                  struct light_state_t const* state)
{
    int err = 0;
    int brightness = rgb_to_brightness(state);

	//ALOGD("set_light_buttons brightness=%d brightnessMode=%d flashMode=%d flashOnMS=%d flashOffMS=%d",
    	//	brightness, state->brightnessMode, state->flashMode, state->flashOnMS, state->flashOffMS);


/*
    if(brightness > 0) {
    	brightness = brightness * MAX_BUTTON_BRIGHTNESS / 255 + 1;
    	if(brightness >  MAX_BUTTON_BRIGHTNESS) {
    		brightness = MAX_BUTTON_BRIGHTNESS;
    	}
    }
    ALOGD("set_light_buttons normBrightness=%d", brightness);
*/

    pthread_mutex_lock(&g_lock);
    err = write_int(BUTTON_FILE, brightness);//on ? 255 : 0);
    pthread_mutex_unlock(&g_lock);

    return 0;
}

static int
set_light_backlight(struct light_device_t* dev,
        struct light_state_t const* state)
{
    int err = 0;
    int brightness = rgb_to_brightness(state);
    pthread_mutex_lock(&g_lock);

    err = write_int(LCD_FILE, brightness);

    pthread_mutex_unlock(&g_lock);

    return err;
}

static int
set_red_led_light(struct light_device_t* dev,
        struct light_state_t const* state, int brightness)
{
	enum LED_STATE led_state = OFF;
    int delay_off;
    int delay_on;

    if(state != NULL) {
        switch (state->flashMode) {
  		case LIGHT_FLASH_NONE:
                	//trigger = NONE;
            		led_state = OFF;
                break;

        	case LIGHT_FLASH_TIMED:
        	case LIGHT_FLASH_HARDWARE:
                	delay_off = state->flashOffMS;
                	delay_on = state->flashOnMS;

                	if (delay_on == 0) {
                		led_state = OFF;
               		} else if (delay_off) {
                		led_state = BLINK;
			} else {
				led_state = ON;
			}
		break;

        	default:
		return -1;
        }
    }

    switch(led_state) {
        case OFF:
            write_int(RED_LED_FILE, 0);
            break;
        case BLINK:
            write_string(RED_LED_TRIGGER_FILE, TIMER);
            write_int(RED_LED_DELAY_ON_FILE, delay_on);
            write_int(RED_LED_DELAY_OFF_FILE, delay_off);
        case ON:
            write_int(RED_LED_FILE, brightness);
        default:
            break;
    }

    return 0;
}

static int
set_red_led_light_state(struct light_device_t* dev,
        struct light_state_t const* state, int brightness, enum STATE_TYPE state_type)
{
    if(is_lit(&g_attention)) {
    	set_red_led_light(dev, NULL, 0);
    	set_red_led_light(dev, &g_attention, brightness);
    } else {
        if(is_lit(&g_battery) && is_lit(&g_notification)) {
        	set_red_led_light(dev, NULL, 0);
        	set_red_led_light(dev, &g_notification, brightness);
        } else if(is_lit(&g_battery)) {
		write_string(RED_LED_TRIGGER_FILE, BATTERY_CHARGING_OR_FULL);
        	set_red_led_light(dev, NULL, 0);
        	set_red_led_light(dev, &g_battery, 65535);
        } else {
        	set_red_led_light(dev, &g_notification, brightness);
        }
    }

    return 0;
}

static int
set_light_battery(struct light_device_t* dev,
        struct light_state_t const* state)
{
    pthread_mutex_lock(&g_lock);
    g_battery = *state;

    int brightness = rgb_to_brightness(state);

	if( brightness > 0 )
	{
		g_battery.flashMode = LIGHT_FLASH_HARDWARE;
		g_battery.flashOnMS = 1;
		g_battery.flashOffMS = 0;
	}

  //  ALOGD("set_light_battery brightness=%d brightnessMode=%d flashMode=%d flashOnMS=%d flashOffMS=%d",
    //		brightness, state->brightnessMode, state->flashMode, state->flashOnMS, state->flashOffMS);

    set_red_led_light_state(dev, state, brightness, BATTERY_STATE);

    pthread_mutex_unlock(&g_lock);

    return 0;
}


static int
set_light_notifications(struct light_device_t* dev,
        struct light_state_t const* state)
{
    pthread_mutex_lock(&g_lock);
    g_notification = *state;

    int brightness = rgb_to_brightness(state);

  //  ALOGD("set_light_notifications brightness=%d brightnessMode=%d flashMode=%d flashOnMS=%d flashOffMS=%d",
    //		brightness, state->brightnessMode, state->flashMode, state->flashOnMS, state->flashOffMS);

    set_red_led_light_state(dev, state, brightness, NOTIFICATION_STATE);

    pthread_mutex_unlock(&g_lock);

    return 0;
}

static int
set_light_attention(struct light_device_t* dev,
        struct light_state_t const* state)
{
    pthread_mutex_lock(&g_lock);
    g_attention = *state;

    /*
     * attention logic tweaks from:
     * https://github.com/CyanogenMod/android_device_samsung_d2-common/commit/6886bdbbc2417dd605f9818af2537c7b58491150
    */
    if (state->flashMode == LIGHT_FLASH_HARDWARE) {
        if (g_attention.flashOnMS > 0 && g_attention.flashOffMS == 0) {
            g_attention.flashMode = LIGHT_FLASH_NONE;
        }
    } else if (state->flashMode == LIGHT_FLASH_NONE) {
        g_attention.color = 0;
    }

    int brightness = rgb_to_brightness(state);

   // ALOGD("set_light_attention brightness=%d brightnessMode=%d flashMode=%d flashOnMS=%d flashOffMS=%d",
    //		brightness, state->brightnessMode, state->flashMode, state->flashOnMS, state->flashOffMS);

    set_red_led_light_state(dev, state, brightness, ATTENTION_STATE);

    pthread_mutex_unlock(&g_lock);

    return 0;
}


/** Close the lights device */
static int
close_lights(struct light_device_t *dev)
{
    if (dev) {
        free(dev);
    }

    return 0;
}


/******************************************************************************/

/**
 * module methods
 */

/** Open a new instance of a lights device using name */
static int open_lights(const struct hw_module_t* module, char const* name,
        struct hw_device_t** device)
{
    int (*set_light)(struct light_device_t* dev,
            struct light_state_t const* state);

    if (0 == strcmp(LIGHT_ID_BACKLIGHT, name)) {
        set_light = set_light_backlight;
    } else if (0 == strcmp(LIGHT_ID_NOTIFICATIONS, name)) {
        set_light = set_light_notifications;
    } else if (0 == strcmp(LIGHT_ID_BATTERY, name)) {
        set_light = set_light_battery;
    } else if (0 == strcmp(LIGHT_ID_ATTENTION, name)) {
        set_light = set_light_attention;
    } else if (0 == strcmp(LIGHT_ID_BUTTONS, name)
	|| 0 == strcmp(LIGHT_ID_KEYBOARD, name)) {
        set_light = set_light_buttons;
    } else {
        return -EINVAL;
    }

	ALOGD("open_lights -> %s", name);

    pthread_once(&g_init, init_globals);

    struct light_device_t *dev = malloc(sizeof(struct light_device_t));
    memset(dev, 0, sizeof(*dev));

    dev->common.tag = HARDWARE_DEVICE_TAG;
    dev->common.version = 0;
    dev->common.module = (struct hw_module_t*)module;
    dev->common.close = (int (*)(struct hw_device_t*))close_lights;
    dev->set_light = set_light;

    *device = (struct hw_device_t*)dev;

    return 0;
}

static struct hw_module_methods_t lights_methods =
{
    .open =  open_lights,
};

struct hw_module_t HAL_MODULE_INFO_SYM =
{
    .tag = HARDWARE_MODULE_TAG,
    .version_major = 1,
    .version_minor = 0,
    .id = LIGHTS_HARDWARE_MODULE_ID,
    .name = "NVIDIA Tegratab lights module",
    .author = "NVIDIA",
    .methods = &lights_methods,
};

