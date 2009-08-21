TEMPLATE = lib
SOURCES += lib/json_driver.cc lib/json_scanner.cpp lib/jsonconverterthread.cpp  lib/json_parser.cc
HEADERS += lib/position.hh lib/json_driver.hh \
    lib/qjson_export.h lib/json_scanner.h \
    lib/location.hh lib/stack.hh \
    lib/jsonconverterthread.h lib/json_parser.hh

DEFINES += QT_DLL
CONFIG -= app_bundle
CONFIG += qt warn_on uitools dll
CONFIG += build_all release
#DESTDIR = $$PWD

#BASE_DIR = $$PWD

isEmpty(OUTPUT_DIR) {
    CONFIG(release):OUTPUT_DIR=$$PWD
    CONFIG(debug):OUTPUT_DIR=$$PWD
}

QMAKE_RPATHDIR = $$OUTPUT_DIR/lib $$QMAKE_RPATHDIR
target.path = $$OUTPUT_DIR/lib
INSTALLS += target

headers.path = $$OUTPUT_DIR/include/qjson
headers.files = $$HEADERS
INSTALLS += headers

DEFINES += USE_SYSTEM_MALLOC

