#ifndef GRAPHICS_H
#define GRAPHICS_H

#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <string>
#include <iostream>


using namespace std;

class Graphics
{
    public:
    Graphics();

    SDL_Texture *Image;
    SDL_Rect Rect, Dest;

    void LoadImage(string filename, SDL_Renderer &Render);
    void Clip(int x, int y, int w, int h);
    void Move(int x, int y);

    void Render(SDL_Renderer &Render, int x, int y, int w, int h);
    void Render(SDL_Renderer &Render);

    virtual ~Graphics();
};

#endif // GRAPHICS_H
