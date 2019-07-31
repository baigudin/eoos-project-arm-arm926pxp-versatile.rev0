# EOOS APP.
#
# @author    Sergey Baigudin, sergey@baigudin.software
# @copyright 2019, Sergey Baigudin, Embedded Team
# @license   http://embedded.team/license/

enable_language(CXX)

add_executable(app
    ${CMAKE_CURRENT_LIST_DIR}/source/Configuration.cpp
    ${CMAKE_CURRENT_LIST_DIR}/source/Program.cpp
)

target_include_directories(app
PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/include
)

target_link_libraries(app
PRIVATE
    eoos
)

set_target_properties(app PROPERTIES PREFIX "app")
set_target_properties(app PROPERTIES OUTPUT_NAME "-eoos-arm926pxp-versatile")
set_target_properties(app PROPERTIES SUFFIX "")
install(TARGETS app RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
