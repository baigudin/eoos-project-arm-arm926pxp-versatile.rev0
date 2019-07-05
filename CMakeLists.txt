# EOOS ARM ARM926PXP Versatile/AB Board.
#
# @author    Sergey Baigudin, sergey@baigudin.software
# @copyright 2019, Sergey Baigudin, Embedded Team
# @license   http://embedded.team/license/

cmake_minimum_required(VERSION 3.8.2)
enable_language(CXX)

project(eoos-arm-arm926pxp-versatile)
add_executable(${PROJECT_NAME} "")
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_98)

add_subdirectory(eoos)
add_subdirectory(app)
