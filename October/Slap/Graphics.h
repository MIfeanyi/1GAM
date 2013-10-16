#ifndef GRAPHICS_H
#define GRAPHICS_H

SDL_Window* G_Window = 0;
SDL_Renderer* G_Renderer = 0;

const int SCREEN_WIDTH = 640;
const int SCREEN_HEIGHT = 480;

SDL_Texture* G_Texture;
SDL_Rect* SourceRect, DestRect;

SDL_Texture* LoadImage(string filename)
{
    SDL_Texture* tex = NULL;
    tex = IMG_LoadTexture(G_Renderer, filename.c_str());
    if(tex == NULL)
    {
        cout<<"ERROR LOADING IMAGE: [filename] "<< filename << endl;
    }
    else
    {
        cout<<"IMAGE LOADED: [filename] "<< filename << endl;
    }
    return tex;
}


void RenderTexture(int x, int y,int h, int w,SDL_Renderer *Render, SDL_Texture *Texture, SDL_Rect *Clip = NULL)
{
    SDL_Rect DestRect;
    DestRect.x = x;
    DestRect.y = y;
    DestRect.h = h;
    DestRect.w = w;

     SDL_RenderCopy(Render, Texture, Clip, &DestRect);
}



#endif // GRAPHICS_H
