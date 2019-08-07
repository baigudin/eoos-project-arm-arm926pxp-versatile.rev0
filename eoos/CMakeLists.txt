# EOOS RT.
#
# @author    Sergey Baigudin, sergey@baigudin.software
# @copyright 2019, Sergey Baigudin, Embedded Team
# @license   http://embedded.team/license/

add_library(eoos OBJECT "")

add_subdirectory(api)
add_subdirectory(cpu)
add_subdirectory(library)
add_subdirectory(system)

#set_target_properties(eoos PROPERTIES PREFIX "")
#set_target_properties(eoos PROPERTIES OUTPUT_NAME "eoos-lib-arm926pxp-versatile")
#set_target_properties(eoos PROPERTIES SUFFIX ".a")
#install(TARGETS eoos LIBRARY DESTINATION ${CMAKE_INSTALL_BINDIR})
