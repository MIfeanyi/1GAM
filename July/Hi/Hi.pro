TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.cpp \
    Source/Window.cpp \
    Source/System.cpp \
    Source/String.cpp \
    Source/Graphics.cpp \
    Source/Font.cpp \
    Source/Audio.cpp \
    EasySDL/Window.cpp \
    EasySDL/System.cpp \
    EasySDL/String.cpp \
    EasySDL/Graphics.cpp \
    EasySDL/Font.cpp \
    EasySDL/Audio.cpp

HEADERS += \
    Headers/Window.hpp \
    Headers/System.hpp \
    Headers/String.hpp \
    Headers/Graphics.hpp \
    Headers/Font.hpp \
    EasySDL/Window.hpp \
    EasySDL/System.hpp \
    EasySDL/String.hpp \
    EasySDL/Graphics.hpp \
    EasySDL/Font.hpp \
    EasySDL/Audio.hpp

