#!/system/bin/sh

# Copyright (c) 2013-2014, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.

USER_GUIDE_DST_DIR=$EMULATED_STORAGE_SOURCE/0/nvidia

USER_GUIDE_EN_SRC_FILE=/system/media/TegraNOTE7LTEUserGuide.pdf
USER_GUIDE_EN_DST_FILE=$USER_GUIDE_DST_DIR/TegraNOTE7LTEUserGuide.pdf
USER_GUIDE_EN_COPY_DONE_FILE=$USER_GUIDE_DST_DIR/.user_guide_en_copy_done_v2

USER_GUIDE_DE_SRC_FILE=/system/media/TegraNOTE7LTEUserGuide-de.pdf
USER_GUIDE_DE_DST_FILE=$USER_GUIDE_DST_DIR/TegraNOTE7LTEUserGuide-de.pdf
USER_GUIDE_DE_COPY_DONE_FILE=$USER_GUIDE_DST_DIR/.user_guide_de_copy_done_v2

USER_GUIDE_ES_SRC_FILE=/system/media/TegraNOTE7LTEUserGuide-es.pdf
USER_GUIDE_ES_DST_FILE=$USER_GUIDE_DST_DIR/TegraNOTE7LTEUserGuide-es.pdf
USER_GUIDE_ES_COPY_DONE_FILE=$USER_GUIDE_DST_DIR/.user_guide_es_copy_done_v2

USER_GUIDE_FR_SRC_FILE=/system/media/TegraNOTE7LTEUserGuide-fr.pdf
USER_GUIDE_FR_DST_FILE=$USER_GUIDE_DST_DIR/TegraNOTE7LTEUserGuide-fr.pdf
USER_GUIDE_FR_COPY_DONE_FILE=$USER_GUIDE_DST_DIR/.user_guide_fr_copy_done_v2

USER_GUIDE_IT_SRC_FILE=/system/media/TegraNOTE7LTEUserGuide-it.pdf
USER_GUIDE_IT_DST_FILE=$USER_GUIDE_DST_DIR/TegraNOTE7LTEUserGuide-it.pdf
USER_GUIDE_IT_COPY_DONE_FILE=$USER_GUIDE_DST_DIR/.user_guide_it_copy_done_v2

USER_GUIDE_JA_SRC_FILE=/system/media/TegraNOTE7LTEUserGuide-ja.pdf
USER_GUIDE_JA_DST_FILE=$USER_GUIDE_DST_DIR/TegraNOTE7LTEUserGuide-ja.pdf
USER_GUIDE_JA_COPY_DONE_FILE=$USER_GUIDE_DST_DIR/.user_guide_ja_copy_done_v2

USER_GUIDE_KO_SRC_FILE=/system/media/TegraNOTE7LTEUserGuide-ko.pdf
USER_GUIDE_KO_DST_FILE=$USER_GUIDE_DST_DIR/TegraNOTE7LTEUserGuide-ko.pdf
USER_GUIDE_KO_COPY_DONE_FILE=$USER_GUIDE_DST_DIR/.user_guide_ko_copy_done_v2

USER_GUIDE_PT_SRC_FILE=/system/media/TegraNOTE7LTEUserGuide-pt.pdf
USER_GUIDE_PT_DST_FILE=$USER_GUIDE_DST_DIR/TegraNOTE7LTEUserGuide-pt.pdf
USER_GUIDE_PT_COPY_DONE_FILE=$USER_GUIDE_DST_DIR/.user_guide_pt_copy_done_v2

USER_GUIDE_RU_SRC_FILE=/system/media/TegraNOTE7LTEUserGuide-ru.pdf
USER_GUIDE_RU_DST_FILE=$USER_GUIDE_DST_DIR/TegraNOTE7LTEUserGuide-ru.pdf
USER_GUIDE_RU_COPY_DONE_FILE=$USER_GUIDE_DST_DIR/.user_guide_ru_copy_done_v2

USER_GUIDE_ZH_SRC_FILE=/system/media/TegraNOTE7LTEUserGuide-zh.pdf
USER_GUIDE_ZH_DST_FILE=$USER_GUIDE_DST_DIR/TegraNOTE7LTEUserGuide-zh.pdf
USER_GUIDE_ZH_COPY_DONE_FILE=$USER_GUIDE_DST_DIR/.user_guide_zh_copy_done_v2

USER_GUIDE_ZT_SRC_FILE=/system/media/TegraNOTE7LTEUserGuide-zt.pdf
USER_GUIDE_ZT_DST_FILE=$USER_GUIDE_DST_DIR/TegraNOTE7LTEUserGuide-zt.pdf
USER_GUIDE_ZT_COPY_DONE_FILE=$USER_GUIDE_DST_DIR/.user_guide_zt_copy_done_v2


if [ -d $EMULATED_STORAGE_SOURCE/0 ]; then
    if [ -f "$USER_GUIDE_EN_SRC_FILE" ]; then
        if [ ! -f "$USER_GUIDE_EN_COPY_DONE_FILE" ]; then
            mkdir -p $USER_GUIDE_DST_DIR
            cp $USER_GUIDE_EN_SRC_FILE $USER_GUIDE_EN_DST_FILE
            echo "user guide copy done" > $USER_GUIDE_EN_COPY_DONE_FILE
        fi
    fi

    if [ -f "$USER_GUIDE_DE_SRC_FILE" ]; then
        if [ ! -f "$USER_GUIDE_DE_COPY_DONE_FILE" ]; then
            mkdir -p $USER_GUIDE_DST_DIR
            cp $USER_GUIDE_DE_SRC_FILE $USER_GUIDE_DE_DST_FILE
            echo "user guide copy done" > $USER_GUIDE_DE_COPY_DONE_FILE
        fi
    fi

    if [ -f "$USER_GUIDE_ES_SRC_FILE" ]; then
        if [ ! -f "$USER_GUIDE_ES_COPY_DONE_FILE" ]; then
            mkdir -p $USER_GUIDE_DST_DIR
            cp $USER_GUIDE_ES_SRC_FILE $USER_GUIDE_ES_DST_FILE
            echo "user guide copy done" > $USER_GUIDE_ES_COPY_DONE_FILE
        fi
    fi

    if [ -f "$USER_GUIDE_FR_SRC_FILE" ]; then
        if [ ! -f "$USER_GUIDE_FR_COPY_DONE_FILE" ]; then
            mkdir -p $USER_GUIDE_DST_DIR
            cp $USER_GUIDE_FR_SRC_FILE $USER_GUIDE_FR_DST_FILE
            echo "user guide copy done" > $USER_GUIDE_FR_COPY_DONE_FILE
        fi
    fi

    if [ -f "$USER_GUIDE_IT_SRC_FILE" ]; then
        if [ ! -f "$USER_GUIDE_IT_COPY_DONE_FILE" ]; then
            mkdir -p $USER_GUIDE_DST_DIR
            cp $USER_GUIDE_IT_SRC_FILE $USER_GUIDE_IT_DST_FILE
            echo "user guide copy done" > $USER_GUIDE_IT_COPY_DONE_FILE
        fi
    fi

    if [ -f "$USER_GUIDE_JA_SRC_FILE" ]; then
        if [ ! -f "$USER_GUIDE_JA_COPY_DONE_FILE" ]; then
            mkdir -p $USER_GUIDE_DST_DIR
            cp $USER_GUIDE_JA_SRC_FILE $USER_GUIDE_JA_DST_FILE
            echo "user guide copy done" > $USER_GUIDE_JA_COPY_DONE_FILE
        fi
    fi

    if [ -f "$USER_GUIDE_KO_SRC_FILE" ]; then
        if [ ! -f "$USER_GUIDE_KO_COPY_DONE_FILE" ]; then
            mkdir -p $USER_GUIDE_DST_DIR
            cp $USER_GUIDE_KO_SRC_FILE $USER_GUIDE_KO_DST_FILE
            echo "user guide copy done" > $USER_GUIDE_KO_COPY_DONE_FILE
        fi
    fi

    if [ -f "$USER_GUIDE_PT_SRC_FILE" ]; then
        if [ ! -f "$USER_GUIDE_PT_COPY_DONE_FILE" ]; then
            mkdir -p $USER_GUIDE_DST_DIR
            cp $USER_GUIDE_PT_SRC_FILE $USER_GUIDE_PT_DST_FILE
            echo "user guide copy done" > $USER_GUIDE_PT_COPY_DONE_FILE
        fi
    fi

    if [ -f "$USER_GUIDE_RU_SRC_FILE" ]; then
        if [ ! -f "$USER_GUIDE_RU_COPY_DONE_FILE" ]; then
            mkdir -p $USER_GUIDE_DST_DIR
            cp $USER_GUIDE_RU_SRC_FILE $USER_GUIDE_RU_DST_FILE
            echo "user guide copy done" > $USER_GUIDE_RU_COPY_DONE_FILE
        fi
    fi

    if [ -f "$USER_GUIDE_ZH_SRC_FILE" ]; then
        if [ ! -f "$USER_GUIDE_ZH_COPY_DONE_FILE" ]; then
            mkdir -p $USER_GUIDE_DST_DIR
            cp $USER_GUIDE_ZH_SRC_FILE $USER_GUIDE_ZH_DST_FILE
            echo "user guide copy done" > $USER_GUIDE_ZH_COPY_DONE_FILE
        fi
    fi

    if [ -f "$USER_GUIDE_ZT_SRC_FILE" ]; then
        if [ ! -f "$USER_GUIDE_ZT_COPY_DONE_FILE" ]; then
            mkdir -p $USER_GUIDE_DST_DIR
            cp $USER_GUIDE_ZT_SRC_FILE $USER_GUIDE_ZT_DST_FILE
            echo "user guide copy done" > $USER_GUIDE_ZT_COPY_DONE_FILE
        fi
    fi
fi
