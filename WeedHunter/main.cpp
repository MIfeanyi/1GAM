#include"Game.h"

int main()
{
    bool Running = true;
    Window App;
    int STATE = 0;

    App.CreateWindow(640,480,"Weed Hunter",false);

    while(Running)
    {
        switch(STATE)
        {
            case 0:
            STATE = UpdateMenu(App);
            break;
        default:
            Running = false;
        };

    }
    cout << "Hello World!" << endl;
    return 0;
}

