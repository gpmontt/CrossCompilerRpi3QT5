#!/usr/bin/env bash

set -e

QT_VERSION=5.9
QT_MODULES="qtxmlpatterns qtdeclarative qtserialport qtquickcontrols"
GCC_VERSION=gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf
BASEDIR=$PWD
#QMAKE_LFLAGS= -static -static-libgcc

CLEAN=false
SYSROOT=/mnt/rasp-pi-root
#DEVICE="linux-rpi3-g++"
DEVICE="linux-rasp-pi3-g++"

USAGE="$(basename "$0") [-h] [-c] [-d device] -- install toolchain and build qt5 for raspberry pi, automated version of https://wiki.qt.io/RaspberryPi2EGLFS

where:
	-h|--help	show this help text
	-c|--clean	clean all modules to force rebuild
	-d|--device	build for a specific device (defaults to linux-rpi3-g++)"

while [[ $# -gt 0 ]]; do
	key="$1"
		
	case $key in
		-c|--clean)
		CLEAN=true
		shift
		;;
		-d|--device)
		DEVICE="$2"
		shift
		shift
		;;
		-h|--help)
		echo "$USAGE"
		exit
		;;
	    	*)
		echo "$USAGE"
		exit
		;;
	esac
done

# clean old build
if [ "$CLEAN" = true ]; then
	rm -rf $BASEDIR/qt5 $BASEDIR/qt5pi
fi

# get compiler
if [ ! -d /opt/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf ]; then
	wget -N https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/$GCC_VERSION.tar.xz
	tar -xf $GCC_VERSION.tar.xz
fi
COMPILER=/opt/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
MAKE_OPTS="-j4"


if [ ! -f $BASEDIR/sysroot-relativelinks.py ]; then
	wget https://raw.githubusercontent.com/riscv/riscv-poky/master/scripts/sysroot-relativelinks.py
	chmod +x sysroot-relativelinks.py
fi

./sysroot-relativelinks.py $SYSROOT
# build qtcore
if [ ! -d qtbase ]; then
	git clone  git://code.qt.io/qt/qtbase.git -b $QT_VERSION
fi
cd qtbase
if [ "$CLEAN" = true ]; then
	git clean -d -f -x
fi
./configure -release -opengl es2 -device $DEVICE -no-use-gold-linker \
-device-option CROSS_COMPILE=$COMPILER -static \
-sysroot $SYSROOT -opensource -confirm-license -make libs \
-prefix /usr/local/qt5pi -extprefix $BASEDIR/qt5pi -hostprefix $BASEDIR/qt5 -v
make ${MAKE_OPTS}
make install
cd ..

# build qt modules
for MODULE in $QT_MODULES; do
	
    if [ ! -d $MODULE ]; then
		git clone  git://code.qt.io/qt/$MODULE.git -b $QT_VERSION
	fi
	echo entering $MODULE
	cd $MODULE

	if [ "$CLEAN" = true ]; then
		git clean -d -f -x
	fi

	$BASEDIR/qt5/bin/qmake
	make ${MAKE_OPTS}
	make install
	cd ..
done
