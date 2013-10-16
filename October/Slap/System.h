#ifndef SYSTEM_H
#define SYSTEM_H


void Init()
{
    if(SDL_Init(SDL_INIT_EVERYTHING) >= 0)
    {
        //good.
        G_Window = SDL_CreateWindow("The Road to success",
                                    SDL_WINDOWPOS_CENTERED,SDL_WINDOWPOS_CENTERED,
                                    SCREEN_WIDTH,SCREEN_HEIGHT,SDL_WINDOW_SHOWN);

        if(G_Window != 0)
        {
            G_Renderer = SDL_CreateRenderer(G_Window,-1,0);
        }
    }

}

#endif // SYSTEM_H
