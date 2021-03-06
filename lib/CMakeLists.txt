include_directories (./)

# add_custom_command (OUTPUT json_parser.cc
#                    PRE_BUILD
#                    COMMAND bison -t -o json_parser.cc -d json_parser.yy
#                    DEPENDS json_parser.yy
#                    WORKING_DIRECTORY ${qjson_SOURCE_DIR}/src/
#                    )

install(FILES
        json_driver.hh
        json_parser.hh
        json_scanner.h
        location.hh
        position.hh
        stack.hh
        jsonconverterthread.h
        qjson_export.h
        DESTINATION include/qjson
)

set(qjson_MOC_HDRS
  jsonconverterthread.h
)

qt4_wrap_cpp(qjson_MOC_SRCS ${qjson_MOC_HDRS})

set (qjson_SRCS json_driver.cc json_scanner.cpp json_parser.cc jsonconverterthread.cpp)

add_library (qjson SHARED ${qjson_SRCS} ${qjson_MOC_SRCS})
target_link_libraries( qjson ${QT_LIBRARIES})

set_target_properties(qjson PROPERTIES
                      VERSION ${QJSON_LIB_MAJOR_VERSION}.${QJSON_LIB_MINOR_VERSION}.${QJSON_LIB_PATCH_VERSION}
                      SOVERSION ${QJSON_LIB_MAJOR_VERSION}
                      DEFINE_SYMBOL QJSON_MAKEDLL
                      )

INSTALL(TARGETS qjson
   LIBRARY DESTINATION ${LIB_INSTALL_DIR}
   RUNTIME DESTINATION bin
   ARCHIVE DESTINATION  ${LIB_INSTALL_DIR}
)
