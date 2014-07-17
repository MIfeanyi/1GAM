#ifndef MENU_H
#define MENU_H

#include <SDL2/SDL.h>

int UpdateMenu(Window &App)
{
    //App.CreateWindow(640,480,"Test Window",false); // Window needs to be created inside of function.
    /*
     *TODO: Implement a system class that is global that handles generics for Window sizes
     */

    bool Running = true;
    SDL_Event Event;
    const Uint8 *Key = SDL_GetKeyboardState(NULL);

    cout<<"Updating Menu... Press [ENTER] to proceed to the game."<<endl;

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
    return 0;
}




#endif // MENU_H
