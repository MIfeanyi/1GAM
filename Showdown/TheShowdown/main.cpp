#include <iostream>
#include <SDL2/SDL.h>

using namespace std;



#include "game.h"


Window App;

int main()
{
    int STATE = 0;
    bool Running = true;

    App.CreateWindow(640,480,"Test Window",false);

    if(SDL_Init(SDL_INIT_EVERYTHING) >= 0)
    {

    }
        else
        {
            return 1;
        }

    while(Running)
    {
        switch(STATE) {
        case 0:
            STATE = UpdateMenu(App);
            break;
        case 1:
            STATE = UpdateGame(App);
            break;
        case 2:
            break;
        default:
            Running = false;
            break;
        }
    }

    SDL_Quit();

    cout << "Hello World!" << endl;
    return 0;
}

