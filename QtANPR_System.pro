#-------------------------------------------------
#
# Project created by QtCreator 2015-03-18T21:27:28
#
#-------------------------------------------------

QT       += core

QT       -= gui

TARGET = QtANPR_System
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app

SOURCES += main.cpp \
    area.cpp \
    image.cpp

HEADERS += \
    area.h \
    image.h

# Подключаем OpenCV
OPENCV_PATH = $$PWD/3rd/OpenCV
OPENCV_LIBS = $$OPENCV_PATH/x86/vc12/lib

LIBS += -L$$OPENCV_LIBS
INCLUDEPATH += $$OPENCV_PATH/include
INCLUDEPATH += $$OPENCV_PATH/include/opencv
INCLUDEPATH += $$OPENCV_PATH/include/opencv2

CONFIG(release, debug|release){
    SHARED_LIB_FILES = $$files($$OPENCV_LIBS/*.lib)
    RELEASE_LIBS = $$find(SHARED_LIB_FILES, "[^d]\.lib.*")
    for(FILE, RELEASE_LIBS) {
        BASENAME = $$basename(FILE)
        LIBS += -l$$replace(BASENAME, "\.lib", "")
    }
}

CONFIG(debug, debug|release){
    SHARED_LIB_FILES = $$files($$OPENCV_LIBS/*d.lib)
    for(FILE, SHARED_LIB_FILES) {
        BASENAME = $$basename(FILE)
        LIBS += -l$$replace(BASENAME, "\.lib", "")
    }
}

# Подключаем leptonica
LEPRONICA_PATH = $$PWD/3rd/Tesseract
LEPRONICA_LIBS = $$LEPRONICA_PATH/lib/Win32

INCLUDEPATH += $$LEPRONICA_PATH/include
INCLUDEPATH += $$LEPRONICA_PATH/include/leptonica
LIBS += -L$$LEPRONICA_LIBS

CONFIG(release, debug|release){
    LIBS += -lliblept171
}

CONFIG(debug, debug|release){
    LIBS += -lliblept171d
}

# Подключаем Tesseract
TESSERACT_PATH = $$PWD/3rd/Tesseract
TESSERACT_LIBS = $$TESSERACT_PATH/lib

TESSERACT_ROOT_INC = $$TESSERACT_PATH/tesseract-ocr
INCLUDEPATH += $$TESSERACT_ROOT_INC/api \
               $$TESSERACT_ROOT_INC/ccmain \
               $$TESSERACT_ROOT_INC/wordrec \
               $$TESSERACT_ROOT_INC/ccstruct \
               $$TESSERACT_ROOT_INC/ccutil \
               $$TESSERACT_ROOT_INC/classify \
               $$TESSERACT_ROOT_INC/cube \
               $$TESSERACT_ROOT_INC/cutil \
               $$TESSERACT_ROOT_INC/dict \
               $$TESSERACT_ROOT_INC/neural_networks/runtime \
               $$TESSERACT_ROOT_INC/opencl \

LIBS += -L$$TESSERACT_LIBS

CONFIG(release, debug|release){
    LIBS += -llibtesseract304
}

CONFIG(debug, debug|release){
    LIBS += -llibtesseract304d
}
