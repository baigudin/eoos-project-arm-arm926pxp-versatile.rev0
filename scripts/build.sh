#!/bin/sh

# This script does all stuff to setup necessary environment for AP development from scratch using a local host only.
#
# @param $1 --rebuild - removes 'build' building directory and fources to rebuild all the project.
# @param $2 --memdump - removes 'build' building directory and fources to rebuild all the project.
#
# SDIR: REPOSITORY/scripts$
# EDIR: REPOSITORY/scripts$
source ./functions.sh

# CDIR: REPOSITORY/scripts$
cd ..

# CDIR: REPOSITORY$
if [ "$1" == "--rebuild" ]; then
    if [ -d "build" ]; then
    	outMessage "REBUILD ALL FLAG IS SET. REMOVING PREVIOUSLY BUILT DIRECTORY..." "INF" -blocked
        rm -r build
    fi
fi
if [ ! -d "build" ]; then
    mkdir build
	mkdir build/CMakeInstallDir
fi
cd build
# CDIR: REPOSITORY/build$
outMessage "CALLING CMAKE..." "INF" -blocked
cmake .. -DCMAKE_TOOLCHAIN_FILE=./../tools/toolchain-arm926ej-s.cmake -DCMAKE_INSTALL_PREFIX=CMakeInstallDir

TOOLCHAIN=/opt/gcc-linaro-7.3.1-2018.05-x86_64_arm-eabi/bin/arm-eabi
ELF=./CMakeInstallDir/bin/eoos-app-arm926pxp-versatile.elf
BIN=./CMakeInstallDir/bin/eoos-app-arm926pxp-versatile.bin

if [ "$2" != "--nomake" ]; then
    outMessage "CALLING MAKE..." "INF" -blocked
    make install
        # VERBOSE=1
        # -j16
        # install

    outMessage "CALLING OBJCOPY..." "INF" -blocked
    outMessage "Creating a binary file of the project..." "CYAN"
    $TOOLCHAIN-objcopy -O binary $ELF $BIN
    outMessage "-- Created: $BIN"
fi

if [ "$2" == "--memdump" -o "$3" == "--memdump" ]; then
    outMessage "ELF INFO..." "INF" -blocked
    $TOOLCHAIN-readelf -S $ELF
fi

outMessage "BUILDING COMPLETED" "OK" -blocked
cd ../scripts/
# CDIR: REPOSITORY/scripts$
