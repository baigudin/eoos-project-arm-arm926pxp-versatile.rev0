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
outMessage "RUNNING IMAGE ON QEMU..." "INF"
qemu-system-arm -M versatilepb -m 128M -nographic -kernel ./../build/CMakeInstallDir/bin/eoos-app-arm926pxp-versatile.bin
outMessage "QEMU IMAGE HAS BEEN EXECUTED" "OK"
