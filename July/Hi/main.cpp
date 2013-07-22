#include <iostream>
#include "Game.hpp"

using namespace std;

int main()
{
    bool Running = true;
    int STATE = 0;
    Window App;
    App.CreateWindow(600,480,"Linux",false);

    switch (STATE) {
    case 0:
        STATE = UpdateMenu(App);
        break;
    default:
        break;
    }
    return 0;
}

