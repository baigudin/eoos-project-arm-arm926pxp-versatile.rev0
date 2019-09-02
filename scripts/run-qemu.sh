#!/bin/sh

# This script runs the program image on QEMU ARM emulator.
#
# @param $1 --gdb - runs the program in debug mode using GDB server on QEMU.
#
# SDIR: REPOSITORY/scripts$
# EDIR: REPOSITORY/scripts$
source ./functions.sh

# CDIR: REPOSITORY/scripts$
if [ "$1" == "--gdb" ]; then
    outMessage "DEBUGGING IMAGE ON QEMU..." "INF" -blocked
    qemu-system-arm -machine versatileab -m 128M -nographic -kernel ./../build/CMakeInstallDir/bin/eoos-app-arm926pxp-versatile.bin -S -gdb tcp::1234
else
    outMessage "RUNNING IMAGE ON QEMU..." "INF" -blocked
    qemu-system-arm -machine versatileab -m 128M -nographic -kernel ./../build/CMakeInstallDir/bin/eoos-app-arm926pxp-versatile.bin
fi
# (qemu) gdbserver
outMessage "QEMU IMAGE HAS BEEN EXECUTED" "OK" -blocked
