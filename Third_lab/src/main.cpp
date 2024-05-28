#include "draw.h"
#include <chrono>
#include <thread>

#include <SDL.h>
#include <stdio.h>
#include <string>
#include <cassert>

bool init();
void close();

SDL_Window *gWindow = NULL;
SDL_Renderer *gRenderer = NULL;
SDL_Texture *gTexture = NULL;
SDL_Surface *loadedSurface = NULL;

void sdl(SDL_Surface *s, int clipping, float scale, float move_x, float move_y, float nu, int num, float R, float a, float centerx, float centery, float alpha, float rotationx, float rotationy)
{
  SDL_RenderClear(gRenderer);
  draw(loadedSurface, clipping, scale, move_x, move_y, nu, num, R, a, centerx, centery, alpha, rotationx, rotationy);
  SDL_UpdateTexture(gTexture, NULL, loadedSurface->pixels, loadedSurface->pitch);
  SDL_RenderCopy(gRenderer, gTexture, NULL, NULL);
  SDL_RenderPresent(gRenderer);
}
bool init()
  {
  bool success = true;
  if (SDL_Init(SDL_INIT_VIDEO) < 0) {
    printf("SDL could not initialize! SDL Error: %s\n", SDL_GetError());
    success = false;
  } else {
    gWindow = SDL_CreateWindow("AOKG Lab 1", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN);
    if (gWindow == NULL) {
      printf("Window could not be created! SDL Error: %s\n", SDL_GetError());
      success = false;
    } else {
      gRenderer = SDL_CreateRenderer(gWindow, -1, SDL_RENDERER_SOFTWARE);
      if (gRenderer == NULL) {
        printf("Renderer could not be created! SDL Error: %s\n", SDL_GetError());
        success = false;
      } else {
        SDL_SetRenderDrawColor(gRenderer, 0xFF, 0xFF, 0xFF, 0xFF);
      }
    }
  }
  return success;
}

void close()
{
  SDL_DestroyTexture(gTexture);
  gTexture = NULL;
  SDL_DestroyRenderer(gRenderer);
  SDL_DestroyWindow(gWindow);
  gWindow = NULL;
  gRenderer = NULL;
  SDL_Quit();
}

void clear_screen(SDL_Surface *s){
  memset(s->pixels, 0, SCREEN_HEIGHT * SCREEN_WIDTH * 4);
}

int main(int argc, char *argv[])
{
  if (!init()) {
    printf("Failed to initialize!\n");
  } else {
    loadedSurface = SDL_CreateRGBSurface(0, SCREEN_WIDTH, SCREEN_HEIGHT, 32,
      0x00FF0000,// R
      0x0000FF00,// G
      0x000000FF,// B
      0x00000000);

    gTexture = SDL_CreateTextureFromSurface(gRenderer, loadedSurface);

    if (NULL == gTexture) {
      printf("Failed to load media!\n");
    } else {
      bool quit = false;
      SDL_Event e;
      int clipping = 1;
      float nu = 0.1, move_y = 0, move_x = 0, scale = 1, move_y1 = move_y, move_x1 = move_x, newX = 0, newY = 0;
      int tmpmove_x1 = move_x1, tmpmove_y1 = move_y1;
      int flag = 0, k = 0, sum_of_move_x = 0,isdragging=0;
      int mouseX, mouseY;
      float a = 150, num = 5, R = a / (2 * sin(M_PI / num)), centerx = SCREEN_WIDTH / 2, centery = SCREEN_HEIGHT / 2, alpha = 0, rotationx = centerx, rotationy = centery;
      while (!quit) {
        while (SDL_PollEvent(&e) != 0) {
          if (SDL_QUIT == e.type) {
            quit = true;
          }
          if (SDL_KEYDOWN == e.type) {
            switch (e.key.keysym.scancode) {
            case SDL_SCANCODE_KP_PLUS:
              scale += 0.1;
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_KP_MINUS:
              if(scale > 0.1){
                scale -= 0.1;
              }
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_UP:
              move_y -= 2;
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_DOWN:
              move_y += 2;
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_LEFT:
              move_x -= 2;
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_RIGHT:
              move_x += 2;
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_KP_9:
              alpha -= 0.05;
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_KP_7:
              alpha += 0.05;
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_KP_5:
              clipping = 0;
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_KP_8:
              clipping = 1;
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_ESCAPE:
              quit = true;
              break;
            default:
              break;
            }
          }
            sdl(loadedSurface, clipping, scale, move_x, move_y, nu, num, R, a, centerx, centery, alpha, rotationx, rotationy);
        }
      }
    }
    close();
    return 0;
  }
}
