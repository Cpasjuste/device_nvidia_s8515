#!/bin/bash

#set -e
export DEVICE=s8515
export VENDOR=nvidia
export SRC=../../../wax-bp/

#cp product-files/ril_atc.config ../../../vendor/nvidia/tegra/icera/ril/modules/ril_atc.config
sed --in-place '/NvCPLSvc/d' ../../../vendor/nvidia/tegra/core/modules.mk
sed --in-place '/NvCPLUpdater/d' ../../../vendor/nvidia/tegra/core/modules.mk
sed --in-place '/libnvcpl/d' ../../../vendor/nvidia/tegra/core/modules.mk
rm -rf ../../../3rdparty/ti
rm -rf ../../../vendor/$VENDOR/$DEVICE

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

for FILE in `egrep -v '(^#|^$)' proprietary-files.txt`; do
  echo "Extracting /system/$FILE ..."
  OLDIFS=$IFS IFS=":" PARSING_ARRAY=($FILE) IFS=$OLDIFS
  FILE=`echo ${PARSING_ARRAY[0]} | sed -e "s/^-//g"`
  DEST=${PARSING_ARRAY[1]}
  if [ -z $DEST ]
  then
    DEST=$FILE
  fi
  DIR=`dirname $FILE`
  if [ ! -d $BASE/$DIR ]; then
    mkdir -p $BASE/$DIR
  fi
  if [ "$SRC" = "adb" ]; then
    adb pull /system/$FILE $BASE/$DEST
  # if file dot not exist try destination
    if [ "$?" != "0" ]
        then
        adb pull /system/$DEST $BASE/$DEST
    fi
  else
    cp $SRC/system/$FILE $BASE/$DEST
    # if file dot not exist try destination
    if [ "$?" != "0" ]
        then
        cp $SRC/system/$DEST $BASE/$DEST
    fi
  fi
done

./setup-makefiles.sh

