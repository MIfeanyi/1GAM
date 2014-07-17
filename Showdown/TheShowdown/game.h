#ifndef GAME_H
#define GAME_H

#include <iostream>
#include <SDL2/SDL.h>

using namespace std;

//Easy SDL
#include "window.h"
#include "graphics.h"

//Game Components
#include "Menu.h"


int UpdateGame(Window &App)
{
    //Create Window & System variables
    //App.CreateWindow(640,480,"Test Window",false);
    bool Running = true;
    SDL_Event Event;
    const Uint8 *Key = SDL_GetKeyboardState(NULL);

    //Media
    Graphics Background;
    //Graphics Player1,Player2;

    while(Running)
    {
        while( SDL_PollEvent( &Event ) != 0 )
        {
            //User requests quit
            if( Event.type == SDL_QUIT )
            {
                Running = false;
            }
        }

        //Check for mouse clicks / keypresses to continue to the game.

        if(Key[SDL_GetScancodeFromKey(SDLK_RETURN)])
        {
            return 1; //Move on to game.
        }

        SDL_SetRenderDrawColor(App.GRender, 0, 0, 0, 255);
        SDL_RenderClear(App.GRender);
        SDL_RenderPresent(App.GRender);
    }

    return -5;
}

















#endif // GAME_H
