#ifndef GAME_HPP
#define GAME_HPP

#include "EasySDL/Graphics.hpp"
#include "EasySDL/Window.hpp"

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

        if( Key[SDLK_SPACE] )
        {
            Running = false;
            return 1;
        }
        if( Key[SDLK_ESCAPE])
        {
            return 20;
        }

        App.LimitFramerate();
        App.Flip();
        App.RenderText();

        App.Clear();
    }

    return 20;
}

#endif // GAME_HPP
