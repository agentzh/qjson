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

#CONFIG += debug_and_release build_all

#CONFIG(debug, debug|release) {
   #TARGET = debug_binary
#} else {
   #TARGET = release_binary
#}

#BASE_DIR = $$PWD
#BASE_DIR = '/sabf'

isEmpty(OUTPUT_DIR) {
    CONFIG(release):OUTPUT_DIR=$$PWD
    CONFIG(debug):OUTPUT_DIR=$$PWD
}

# QT+=xml network webkit
#QT_INSTALL_PREFIX=/a/b/c
QMAKE_RPATHDIR = $$OUTPUT_DIR/lib $$QMAKE_RPATHDIR
#solibs.output = "/a/b/c"
solibs.files = libQJson.so
solibs.path = $$OUTPUT_DIR
INSTALLS += solibs

DEFINES += USE_SYSTEM_MALLOC

