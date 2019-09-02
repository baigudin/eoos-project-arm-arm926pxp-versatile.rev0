#!/bin/sh

# This script obtains and installs all environment.
#
# SDIR: REPOSITORY/scripts$
# EDIR: REPOSITORY/scripts$
source ./functions.sh

outMessage "OBTAINING ENVIRONMENT..." "INF" -blocked

# CDIR: REPOSITORY/scripts$

if [ -d "temp" ]; then
	rm -r temp
fi
if [ ! -d "build" ]; then
    mkdir temp
fi

cd temp
# CDIR: REPOSITORY/scripts/temp$

outMessage "Installing essentials packages..." "INF" -blocked
sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping
outMessage "Installing graphical and Eclipse plugins..." "INF" -blocked
sudo apt-get install libsdl1.2-dev xterm
outMessage "Downloading toolchain..." "INF" -blocked
wget https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05/arm-eabi/gcc-linaro-7.3.1-2018.05-x86_64_arm-eabi.tar.xz
outMessage "Installing toolchain..." "INF" -blocked
sudo tar -Jxvf gcc-linaro-7.3.1-2018.05-x86_64_arm-eabi.tar.xz -C /opt

cd ..
# CDIR: REPOSITORY/scripts$
