# EOOS APP.
#
# @author    Sergey Baigudin, sergey@baigudin.software
# @copyright 2019, Sergey Baigudin, Embedded Team
# @license   http://embedded.team/license/

enable_language(CXX)

target_include_directories(${PROJECT_NAME}
PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/include
)

target_sources(${PROJECT_NAME}
PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/source/Configuration.cpp
    ${CMAKE_CURRENT_LIST_DIR}/source/Program.cpp
)
