#!/bin/sh

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
if [ ! -d "projects" ]; then
    mkdir projects
fi
cd projects
# CDIR: REPOSITORY/projects$
if [ "$1" == "--rebuild" ]; then
    if [ -d "eclipse" ]; then
    	outMessage "REBUILD ALL FLAG IS SET. REMOVING PREVIOUSLY BUILT DIRECTORY..." "INF" -blocked
        rm -r eclipse
    fi
fi
if [ ! -d "eclipse" ]; then
    mkdir eclipse
fi
cd eclipse
# CDIR: REPOSITORY/projects/eclipse$
outMessage "CALLING CMAKE..." "INF" -blocked
cmake -G "Eclipse CDT4 - Unix Makefiles" ../.. -DCMAKE_TOOLCHAIN_FILE=./../../tools/toolchain-arm926ej-s.cmake -DCMAKE_INSTALL_PREFIX=CMakeInstallDir

outMessage "BUILDING COMPLETED" "OK" -blocked
cd ../../scripts/
# CDIR: REPOSITORY/scripts$
