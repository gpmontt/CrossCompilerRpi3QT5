TravisCI: [![Build Status](https://travis-ci.com/gpmontt/cross-compile-toolchain.svg?branch=master)](https://travis-ci.com/gpmontt/cross-compile-toolchain)  

[![CircleCI](https://circleci.com/gh/velocitymob/cross-compile-toolchain/tree/master.svg?style=svg)](https://circleci.com/gh/velocitymob/cross-compile-toolchain/tree/master)

CircleCI: [![CircleCI Build Status](https://circleci.com/gh/velocitymob/cross-compile-toolchain.svg?style=shield)](https://circleci.com/gh/velocitymob/cross-compile-toolchain)

# Cross-compile-toolchain 

# INSTRUCTIONS

This project tries to generate the workflow to build a crosscompiler for the Raspberrypi3 together with the qt5 library.
For this purpose are necessary:
- sysroot
- toolchain compatible with the raspberry
- qtbase Source

We are using the version [Linaro GCC 7.3-2018.05](https://releases.linaro.org/components/toolchain/binaries/latest-7/). You can try another version from gcc-linaro if you want.

The script produces as result 2 folders with the names qt5 and qt5pi in format zip.
and the sysroot is available [here](https://www.dropbox.com/s/4nm8saa2snh8un4/rpiSysroot-2018-06-27-raspbian-stretch-lite-updated.tar.xz?dl=0)

If you want to try with another toolchain, sysroot or another modules for qt5, please feel free to play and contribute and just do it! :D
This repository is used to as container. 
