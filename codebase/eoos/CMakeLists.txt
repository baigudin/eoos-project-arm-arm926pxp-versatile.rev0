# EOOS RT.
#
# @author    Sergey Baigudin, sergey@baigudin.software
# @copyright 2019, Sergey Baigudin, Embedded Team
# @license   http://embedded.team/license/

add_library(target-eoos OBJECT "")

add_subdirectory(api)
add_subdirectory(cpu)
add_subdirectory(library)
add_subdirectory(system)

# set_target_properties(target-eoos PROPERTIES PREFIX "")
# set_target_properties(target-eoos PROPERTIES OUTPUT_NAME "eoos-lib-arm926pxp-versatile")
# set_target_properties(target-eoos PROPERTIES SUFFIX ".a")
# install(TARGETS target-eoos LIBRARY DESTINATION ${CMAKE_INSTALL_BINDIR})
