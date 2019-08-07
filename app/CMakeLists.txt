# EOOS APP.
#
# @author    Sergey Baigudin, sergey@baigudin.software
# @copyright 2019, Sergey Baigudin, Embedded Team
# @license   http://embedded.team/license/

add_executable(app
    ${CMAKE_CURRENT_LIST_DIR}/source/Configuration.cpp
    ${CMAKE_CURRENT_LIST_DIR}/source/Program.cpp

    $<TARGET_OBJECTS:eoos>
)

target_include_directories(app
PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/include
)

target_link_libraries(app
PRIVATE
    eoos
)

set(LINKER_SCRIPT ${CMAKE_CURRENT_LIST_DIR}/memory/memory.arm926ej-s.gcc.v7.3.x.ld)
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T ${LINKER_SCRIPT}")

set_target_properties(app PROPERTIES PREFIX "")
set_target_properties(app PROPERTIES OUTPUT_NAME "eoos-app-arm926pxp-versatile")
set_target_properties(app PROPERTIES SUFFIX ".elf")
install(TARGETS app RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
