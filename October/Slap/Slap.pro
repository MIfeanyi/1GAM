TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.cpp \
    player.cpp \
    irrXML.cpp \
    map.cpp

LIBS += -L/usr/lib -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf

HEADERS += \
    player.h \
    Graphics.h \
    Audio.h \
    Game.h \
    System.h \
    CXMLReaderImpl.h \
    fast_atof.h \
    heapsort.h \
    irrArray.h \
    irrString.h \
    irrTypes.h \
    irrXML.h \
    map.h
