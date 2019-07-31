#!/bin/sh
#
# This script does all stuff to setup necessary environment for AP development from scratch using a local host only.
#
# @param $1 -rebuild - removes 'build' building directory and fources to rebuild all the project.
# @param $1/$2 -copy - copies the built binary to the mounted rootfs of the Linux image.
# @param $1/$2 -xxx - copies the built binary to the mounted rootfs of the Linux image.
#
# SDIR: REPOSITORY/scripts$
# EDIR: REPOSITORY/scripts$
source ./functions.sh

# CDIR: REPOSITORY/scripts$
cd ..

# CDIR: REPOSITORY$
if [ "$1" == "-rebuild" ]; then
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
cmake .. -DCMAKE_INSTALL_PREFIX=CMakeInstallDir
outMessage "CALLING MAKE..." "INF"
make install
# -j16
# VERBOSE=1
outMessage "BUILT to REPOSITORY/build" "OK"

cd ../scripts/
# CDIR: REPOSITORY/scripts$
