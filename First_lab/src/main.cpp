#include "draw.h"

#include <SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <cassert>

bool init();
void close();

SDL_Window *gWindow = NULL;
SDL_Renderer *gRenderer = NULL;
SDL_Texture *gTexture = NULL;
SDL_Surface *loadedSurface = NULL;

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

void clearScreen(SDL_Surface* s) {
  memset(s->pixels, 0, SCREEN_HEIGHT * SCREEN_WIDTH * 4);
}

int main(int argc, char *argv[])
{
  float a = 30;
  float b = 90;
  int x_move = SCREEN_WIDTH / 2;
  int y_move = SCREEN_HEIGHT / 2;
  float alpha = 0;
  float beta = 0;
  int rotate_x = SCREEN_WIDTH / 2;
  int rotate_y = SCREEN_HEIGHT / 2;
  float diff_x = 0, diff_y = 0;
  if (!init()) {
    printf("Failed to initialize!\n");
  } else {
    loadedSurface = SDL_CreateRGBSurface(0, SCREEN_WIDTH, SCREEN_HEIGHT, 32,
      0x00FF0000,// R
      0x0000FF00,// G
      0x000000FF,// B
      0x00000000);// alpha

    gTexture = SDL_CreateTextureFromSurface(gRenderer, loadedSurface);

    if (NULL == gTexture) {
      printf("Failed to load media!\n");
    } else {
      bool quit = false;
      SDL_Event e;

      while (!quit) {
        while (SDL_PollEvent(&e) != 0) {
          if (SDL_QUIT == e.type) {
            quit = true;
          }
          if (SDL_KEYDOWN == e.type) {
            switch (e.key.keysym.scancode) {
            case SDL_SCANCODE_KP_PLUS:
              printf("SDL_SCANCODE_KP_PLUS have been presssed\n");
                a *= 1.1;
                b *= 1.1;
              clearScreen(loadedSurface);
            break;
            case SDL_SCANCODE_KP_MINUS:
              printf("SDL_SCANCODE_KP_MINUS have been presssed\n");
                a /= 1.1;
                b /= 1.1;
                clearScreen(loadedSurface);
              break;
            case SDL_SCANCODE_ESCAPE:
              quit = true;
              break;
            case SDL_SCANCODE_KP_1:
              printf("SDL_SCANCODE_KP_2 have been presssed\n");
              a = 30;
              b = 90;
              clearScreen(loadedSurface);
              break;
            case SDL_SCANCODE_KP_2:
              printf("SDL_SCANCODE_KP_2 have been presssed\n");
              a = 40;
              b = 60;
              clearScreen(loadedSurface);
              break;
            case SDL_SCANCODE_KP_3:
              printf("SDL_SCANCODE_KP_2 have been presssed\n");
              a = 60;
              b = sqrt(2000);
              clearScreen(loadedSurface);
              break;
            case SDL_SCANCODE_RIGHT:
              printf("SDL_SCANCODE_RIGHT have been pressed\n");
              x_move += 10;
              clearScreen(loadedSurface);
              break;
            case SDL_SCANCODE_LEFT:
              printf("SDL_SCANCODE_LEFT have been pressed\n");
              x_move -= 10;
              clearScreen(loadedSurface);
              break;
            case SDL_SCANCODE_UP:
              printf("SDL_SCANCODE_UP have been pressed\n");
              y_move -= 10;
              clearScreen(loadedSurface);
              break;
            case SDL_SCANCODE_DOWN:
              printf("SDL_SCANCODE_DOWN have been pressed\n");
              y_move += 10;
              clearScreen(loadedSurface);

              break;
            case SDL_SCANCODE_KP_ENTER:
              printf("SDL_SCANCODE_DOWN have been pressed\n");
              x_move = SCREEN_WIDTH / 2;
              y_move = SCREEN_HEIGHT / 2;
              clearScreen(loadedSurface);
              break;
            case SDL_SCANCODE_KP_4:
              beta += 0.1;
              clearScreen(loadedSurface);
              break;
            case SDL_SCANCODE_KP_6:
              beta -= 0.1;
              clearScreen(loadedSurface);
              break;
            case SDL_SCANCODE_KP_5:
              beta = 0;
              clearScreen(loadedSurface);
              break;
              case SDL_SCANCODE_KP_7:
              alpha += 0.1;
              clearScreen(loadedSurface);
              break;
            case SDL_SCANCODE_KP_9:
              alpha -= 0.1;
              clearScreen(loadedSurface);
              break;
            case SDL_SCANCODE_KP_8:
              alpha = 0;
              clearScreen(loadedSurface);
              break;
            default:
              break;
            }
          }
          if (e.type == SDL_MOUSEBUTTONDOWN) {
            SDL_GetMouseState(&rotate_x, &rotate_y);
            alpha += beta;
            beta = 0;

            x_move += round(diff_x);
            y_move += round(diff_y);

            diff_x = 0;
            diff_y = 0;

            clearScreen(loadedSurface);
          }
        }
        SDL_RenderClear(gRenderer);

        draw(loadedSurface, a, b, x_move, y_move, alpha, beta, rotate_x, rotate_y, diff_x, diff_y);

        SDL_UpdateTexture(gTexture, NULL, loadedSurface->pixels, loadedSurface->pitch);
        SDL_RenderCopy(gRenderer, gTexture, NULL, NULL);
        SDL_RenderPresent(gRenderer);
      }
    }
  }
  close();
  return 0;
}
