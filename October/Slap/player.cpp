#include "player.h"

Player::Player()
{
}

Player::~Player()
{
    SDL_DestroyTexture(IMG);
}
