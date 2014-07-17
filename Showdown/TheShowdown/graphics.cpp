#include "graphics.h"

Graphics::Graphics()
{

}

void Graphics::LoadImage(string filename,SDL_Renderer &Render)
{

    SDL_Texture *texture = IMG_LoadTexture(&Render, filename.c_str());
    if(texture == NULL)
    {
        //logSDLError(std::cout, "LoadTexture");
    }
    else
    {
        Image = texture;

    }
}

void Graphics::Render(SDL_Renderer &Render, int x, int y, int w, int h)
{
    SDL_Rect Dst;

    Dst.x = x; Dst.y = y; Dst.w = w; Dst.h = h;

    SDL_RenderCopy(&Render, Image, NULL, &Dst);
}
void Graphics::Render(SDL_Renderer &Render)
{
    SDL_RenderCopy(&Render, Image, NULL, &Dest);
}

Graphics::~Graphics()
{

}
