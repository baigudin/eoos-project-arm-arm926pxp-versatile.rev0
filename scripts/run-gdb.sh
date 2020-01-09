#!/bin/sh

# This script runs GDB client.
#
# SDIR: REPOSITORY/scripts$
# EDIR: REPOSITORY/scripts$
source ./functions.sh

# CDIR: REPOSITORY/scripts$
outMessage "RUNNING GDB CLIENT..." "INF" -blocked
/opt/gcc-linaro-7.3.1-2018.05-x86_64_arm-eabi/bin/arm-eabi-gdb ./../build/CMakeInstallDir/bin/eoos-app-arm926pxp-versatile.elf
outMessage "GDB CLIENT STOPPED" "OK" -blocked
