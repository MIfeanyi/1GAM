#ifndef GAME_H
#define GAME_H

#include <iostream>
#include"EasySDL/Window.hpp"


using namespace std;


int UpdateMenu(Window &App)
{
    App.FPS =60;
    Uint8 *Key;
    SDL_Event Event;
    bool Running = true;

    while(Running)
    {
        Key = SDL_GetKeyState(NULL);

        while( SDL_PollEvent(&Event) )
        {
            if(Event.type == SDL_QUIT)
            {
                Running = false;

            }
        }
    }
    return 1;
}

int UpdateGame(Window &App)
{
    App.FPS =60;
    Uint8 *Key;
    SDL_Event Event;
    bool Running = true;

    while(Running)
    {
        Key = SDL_GetKeyState(NULL);

        while( SDL_PollEvent(&Event) )
        {
            if(Event.type == SDL_QUIT)
            {
                Running = false;

            }
        }
    }
    return 1;
}










#endif // GAME_H
