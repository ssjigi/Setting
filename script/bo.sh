#!/bin/bash
RUN_TIME=0100
SLEEP_TIME=3600
CPU_USAGE=8
real_compile()
{
	source build/envsetup.sh
		lunch $PRODUCT-userdebug

		make clean

		./vendor/synaptics/build/build_androidtv -p oc_$PRODUCT -m ./vendor/synaptics-sdk -n $CPU_USAGE -s clean,sdk,install,patch

		sed -i 's/ANDROID_COMPILE_WITH_JACK := true/ANDROID_COMPILE_WITH_JACK := false/g' build/core/combo/javac.mk 

#make dist -j$CPU_USAGE
		make clean
		make  -j$CPU_USAGE
		make image -j$CPU_USAGE
#sed -i 's/ro.secure=1/ro.secure=0/g' out/target/product/$PRODUCT/root/default.prop
		make otapackage -j$CPU_USAGE
}

if [ ! -z "$1" ]
then
	RUN_TIME=$1
fi
if [ ! -z "$2" ]
then
	CPU_USAGE=$2
fi
echo "will be started at $RUN_TIME. will be checked by $SLEEP_TIME seconds "
while [ 1 ]
do
	CUR_TIME=`date +'%m%d%H%M'`
	echo "waiting runtime RUN_TIME=$RUN_TIME, CUR_TIME=$CUR_TIME buildtype=$BUILD_TYPE"
	if [ $RUN_TIME -le $CUR_TIME ] # RUN_TIME < CUR_TIME
	then
		real_compile	
		exit 0
	fi
	sleep $SLEEP_TIME 
done
