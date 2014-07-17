#include "window.h"

Window::Window()
{
}


Window::Window(int WindowWidth, int WindowHeight, string WindowTitle, bool Full)
{
    if(!Full)
    {
        GWindow = SDL_CreateWindow(WindowTitle.c_str(),SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, WindowWidth,WindowHeight, SDL_WINDOW_SHOWN);
        if(GWindow != 0)
        {
            cout<<"GWindow Created Successfully: ("<< WindowWidth <<", "<< WindowHeight << ")"<<endl;



        }
        else
        {
            //Error Output
        }
        GRender = SDL_CreateRenderer(GWindow,-1,0);
    }
    else
    {
        //Learn how to make a fullscreen window.
    }
}



void Window::CreateWindow(int WindowWidth, int WindowHeight, string WindowTitle, bool Full)
{
    if(!Full)
    {
        GWindow = SDL_CreateWindow(WindowTitle.c_str(),SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, WindowWidth,WindowHeight, SDL_WINDOW_SHOWN);
        if(GWindow != 0)
        {
            cout<<"GWindow Created Successfully: ("<< WindowWidth <<", "<< WindowHeight << ")"<<endl;
            GRender = SDL_CreateRenderer(GWindow,-1,0);
            Screen = SDL_GetWindowSurface( GWindow );

            //Fill the surface white
            SDL_FillRect( Screen, NULL, SDL_MapRGB( Screen->format, 0xFF, 0xFF, 0xFF ) );

            //Update the surface
            SDL_UpdateWindowSurface( GWindow );
        }
        else
        {
            //Error Output
        }
    }
    else
    {
        //Learn how to make a fullscreen window.
    }
}

void Window::CreateWindow(bool Full, string WindowTitle)
{
    /*
    if(!Full)
    {
        GWindow = SDL_CreateWindow(WindowTitle.c_str(),SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, WindowWidth,WindowHeight, SDL_WINDOW_SHOWN);
        if(GWindow != 0)
        {
            GRender = SDL_CreateRenderer(GWindow,-1,0);

        }
        else
        {
            //Error Output
        }
    }
    else
    {
        //Learn how to make a fullscreen window.
    }
    */
}


 void Window::Update()
 {

 }

Window::~Window()
{
}
