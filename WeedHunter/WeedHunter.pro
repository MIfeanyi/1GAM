TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.cpp \
    EasySDL/Window.cpp \
    EasySDL/System.cpp \
    EasySDL/String.cpp \
    EasySDL/Graphics.cpp \
    EasySDL/Font.cpp \
    EasySDL/Audio.cpp \
    player.cpp

LIBS += `sdl-config --libs` -lSDL_image -lSDL_ttf -lSDL_mixer

HEADERS += \
    Game.h \
    EasySDL/Window.hpp \
    EasySDL/System.hpp \
    EasySDL/String.hpp \
    EasySDL/Graphics.hpp \
    EasySDL/Font.hpp \
    EasySDL/Audio.hpp \
    player.h
