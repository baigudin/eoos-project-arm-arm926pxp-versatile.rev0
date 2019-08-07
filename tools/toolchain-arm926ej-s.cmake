# EOOS ARM ARM926PXP Versatile/AB Board.
#
# @author    Sergey Baigudin, sergey@baigudin.software
# @copyright 2019, Sergey Baigudin, Embedded Team
# @license   http://embedded.team/license/

# This one is important
set(CMAKE_SYSTEM_NAME Generic)

# Specify the cross compiler
set(CMAKE_C_COMPILER   /opt/gcc-linaro-7.3.1-2018.05-x86_64_arm-eabi/bin/arm-eabi-gcc)
set(CMAKE_CXX_COMPILER /opt/gcc-linaro-7.3.1-2018.05-x86_64_arm-eabi/bin/arm-eabi-g++)

# Search for programs in the build host directories
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# For libraries and headers in the target directories
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Set flags for Assembly sources
set(ASM_OPTIONS "-x assembler-with-cpp" CACHE STRING "" FORCE)
set(CMAKE_ASM_FLAGS "${CFLAGS} ${ASM_OPTIONS}" CACHE STRING "" FORCE)

# Set flags for C/C++ sources
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -marm -march=armv5te -mtune=arm926ej-s -Og -g" CACHE STRING "" FORCE)
