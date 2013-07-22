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
    input.cpp \
    menu.cpp \
    textbox.cpp

HEADERS += \
    EasySDL/Window.hpp \
    EasySDL/System.hpp \
    EasySDL/String.hpp \
    EasySDL/Graphics.hpp \
    EasySDL/Font.hpp \
    EasySDL/Audio.hpp \
    Game.hpp \
    input.hpp \
    menu.hpp \
    textbox.hpp

LIBS += -L/usr/lib -lSDL -lSDL_image -lSDL_mixer -lSDL_ttf


