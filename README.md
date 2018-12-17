# CrossCompilerRpi3QT5


# TravisCI: [![Build Status](https://travis-ci.com/gpmontt/CrossCompilerRpi3QT5.svg?branch=master)](https://travis-ci.com/gpmontt/CrossCompilerRpi3QT5)


# CircleCI: [![CircleCI Build Status](https://circleci.com/gh/gpmontt/CrossCompilerRpi3QT5.svg?style=shield)](https://circleci.com/gh/gpmontt/CrossCompilerRpi3QT5r)


# INSTRUCCTION

this project try to generate the workflow to build a crosscompiler for the Raspberrypi3 togehter with the qt5 library.
For this propose is necessary:
- sysroot
- toolchain compatibel with the raspberry
- qtbase Source 

We are using the version [Linaro GCC 7.3-2018.05](https://releases.linaro.org/components/toolchain/binaries/latest-7/), but  fell you free to play and  use another  version for this one 

the script produce as resoult 2 folder with the name qt5 and qt5pi in format zip.
and the sysroot is available [here](https://www.dropbox.com/s/4nm8saa2snh8un4/rpiSysroot-2018-06-27-raspbian-stretch-lite-updated.tar.xz?dl=0)


if you want to try with another toolchain, sysroot or another modules for qt5, please fell you free to play and contribute and just do it! :D
