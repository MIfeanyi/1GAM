TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.cpp \
    window.cpp \
    graphics.cpp \
    font.cpp

HEADERS += \
    game.h \
    window.h \
    Menu.h \
    graphics.h \
    font.h

LIBS += -L/usr/lib -lSDL2 -lSDL2_image -lSDL2_mixer
