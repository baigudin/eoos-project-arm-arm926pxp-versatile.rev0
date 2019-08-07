#!/bin/sh
#
# This script does all stuff to setup necessary environment for AP development from scratch using a local host only.
#
# @param $1 -rebuild - removes 'build' building directory and fources to rebuild all the project.
#
# SDIR: REPOSITORY/scripts$
# EDIR: REPOSITORY/scripts$
source ./functions.sh

# CDIR: REPOSITORY/scripts$
cd ..

# CDIR: REPOSITORY$
if [ "$1" == "--rebuild" ]; then
    if [ -d "build" ]; then
    	outMessage "REBUILD ALL FLAG IS SET. REMOVING PREVIOUSLY BUILT DIRECTORY..." "INF"
        rm -r build
    fi
fi
if [ ! -d "build" ]; then
    mkdir build
	mkdir build/CMakeInstallDir
fi
cd build
# CDIR: REPOSITORY/build$
outMessage "CALLING CMAKE..." "INF"
cmake .. -DCMAKE_TOOLCHAIN_FILE=./../tools/toolchain-arm926ej-s.cmake -DCMAKE_INSTALL_PREFIX=CMakeInstallDir

outMessage "CALLING MAKE..." "INF"
make install
    # VERBOSE=1
    # -j16
    # install

TOOLCHAIN=/opt/gcc-linaro-7.3.1-2018.05-x86_64_arm-eabi/bin/arm-eabi
ELF=./CMakeInstallDir/bin/eoos-app-arm926pxp-versatile.elf
BIN=./CMakeInstallDir/bin/eoos-app-arm926pxp-versatile.bin

outMessage "CALLING OBJCOPY..." "INF"

$TOOLCHAIN-objcopy -O binary $ELF $BIN

#outMessage "ELF INFO..." "INF"
#$TOOLCHAIN-readelf -S $ELF


outMessage "BUILDING COMPLETED" "OK"
cd ../scripts/
# CDIR: REPOSITORY/scripts$
