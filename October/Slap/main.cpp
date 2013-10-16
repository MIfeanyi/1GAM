#include "Game.h"

int main(int argc, char* args[])
{
    Init();

    bool Running = true;
    int STATE = 0;
    while(Running)
    {
        switch(STATE)
        {
        case 0:
            STATE = UpdateMenu();
            break;
        case 1:
            //I guess Update Game goes here
            break;
        case 2:
            //Credits Menu
            break;
        default:
            //Something fucked up...
            break;
        }
    }

    cout << "Good Bye!" << endl;

    SDL_Quit();


    return 0;
}

