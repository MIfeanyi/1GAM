#ifndef WINDOW_H
#define WINDOW_H

#include <string>
#include <SDL2/SDL.h>
#include <iostream>

using namespace std;

class Window
{
public:
    Window();

    Window(int WindowWidth, int WindowHeight, string WindowTitle, bool Full);

    void CreateWindow(int WindowWidth, int WindowHeight, string WindowTitle, bool Full);
    void CreateWindow(bool Full, string WindowTitles);

    virtual ~Window();
    
    void Draw( /*Graphics &Gfx */); //TODO: Overload Draw for DrawText
    void Update();
    void Clear();
    void Clear(int R, int G, int B);
    void Present();
    void LimitFramerate();
    void DrawText(/* String &DrawString, Font &font, int x, int y */);
    //void RenderText(); Merge / overload with Present

    int Width, Height;

    //for FPS limiter
    int FPS, Tick;

//protected:

    bool Fullscreen, IsOpen;
    string Title;
    /* //TODO: Update with SDL 2.0 textures
    SDL_Surface *Screen;
    SDL_Surface *Text;
    SDL_Surface *Buffer;
    */
    SDL_Window* GWindow = NULL;
    SDL_Renderer* GRender = NULL;
    SDL_Surface *Screen;

private:
};

#endif // WINDOW_H
