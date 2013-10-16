#ifndef GAME_H
#define GAME_H

#include <iostream>
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>

using namespace std;
using namespace irr; // irrXML is located
using namespace io;  // in the namespace irr::io

#include "irrXML.h"

#include "Graphics.h"
#include "System.h"
#include "Audio.h"
#include "player.h"


int UpdateMenu()
{
    //Textures
    Player Green;
    Green.IMG = LoadImage("green.png");
    SDL_Texture* Background = LoadImage("Background.png");

    //Audio


    //Etc.
    SDL_Event Event;
    bool Running = true;
    while(Running)
    {
        while(SDL_PollEvent(&Event))
        {
            if(Event.type == SDL_QUIT)
            {
                Running = false;
            }
        }

        SDL_SetRenderDrawColor(G_Renderer,0,0,0,255);
        SDL_RenderClear(G_Renderer);
        RenderTexture(0,0,SCREEN_HEIGHT,SCREEN_WIDTH,G_Renderer,Background,NULL);
        RenderTexture(50,50,32,32,G_Renderer,Green.IMG,NULL);
        SDL_RenderPresent(G_Renderer);
    }

    SDL_DestroyTexture(G_Texture);
    SDL_DestroyRenderer(G_Renderer);
    SDL_DestroyWindow(G_Window);

    return 20; //break Switch case so we can exit
}

int UpdateGame()
{
    return 30;
}

int UpdateCredits()
{
    return 40;
}

#endif // GAME_H
