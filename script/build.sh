#!/bin/bash

RUN_TIME=0100
SLEEP_TIME=3600
BUILD_TYPE=userdebug

# 본인에 맞게 컴파일 조건을 사용하세요!!
compile_full()
{
	echo "start build !!"
	source build/envsetup.sh 
	lunch $PRODUCT-$BUILD_TYPE
#	pch # svn update recent-revision && apply_lg_patches
	chmod 755 $LGEDEVICE/$LGESRC/$PRODUCT/overlays/apply_lg_patches.sh
	sh ./$LGEDEVICE/$LGESRC/$PRODUCT/overlays/apply_lg_patches.sh

	make clean && make clean_linux && make clean_mv88de3100_sdk

	make linux_all -j4
	rc=$?
	if [[ $rc != 0 ]] ; then
		echo failed make linux_all
		exit $rc
	fi

	make amp_core
	rc=$?
	if [[ $rc != 0 ]] ; then
		echo failed make amp_core
		exit $rc
	fi

	make mv88de3100_sdk
	rc=$?
	if [[ $rc != 0 ]] ; then
		echo failed make mv88de3100_sdk
		exit $rc
	fi

	rm -rf ./bootable/recovery/res-xhdpi/images/.svn
	make -j8
	rc=$?
	if [[ $rc != 0 ]] ; then
		echo failed make 
		exit $rc
	fi

	if [ $BUILD_TYPE = "userdebug" ];then
		sed -i 's/ro.secure=1/ro.secure=0/g' out/target/product/$PRODUCT/root/default.prop
	fi
	make image -j8
	rc=$?
	if [[ $rc != 0 ]] ; then
		echo failed make otapackage
		exit $rc
	fi
	make otapackage -j8
	rc=$?
	if [[ $rc != 0 ]] ; then
		echo failed make otapackage
		exit $rc
	fi
}

if [ ! -z "$1" ]
then
	RUN_TIME=$1
fi

if [ ! -z "$2" ]
then
	BUILD_TYPE=$2
fi

echo "will be started at $RUN_TIME. will be checked by $SLEEP_TIME seconds "
while [ 1 ]
do
	CUR_TIME=`date +'%m%d%H%M'`
	echo "waiting runtime RUN_TIME=$RUN_TIME, CUR_TIME=$CUR_TIME buildtype=$BUILD_TYPE"
	if [ $RUN_TIME -le $CUR_TIME ] # RUN_TIME < CUR_TIME
	then
		compile_full
		exit 0
	fi
	sleep $SLEEP_TIME 
done



