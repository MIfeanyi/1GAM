#ifndef PLAYER_H
#define PLAYER_H

#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <iostream>
#include <string>

using namespace std;

class Player
{
public:

    Player();
    ~Player();
    SDL_Texture* IMG;
    SDL_Rect* GetPos();
protected:
    SDL_Rect* Pos;
    SDL_Rect* Rect;

    //Abilities
    //Health
    //Speed, Velocity, Etc.
    //
};

#endif // PLAYER_H
