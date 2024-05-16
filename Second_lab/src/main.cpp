#include "draw.h"

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

void clear_screen(SDL_Surface *s)
{
  memset(s->pixels, 0, SCREEN_HEIGHT * SCREEN_WIDTH * 4);
}

int main(int argc, char *argv[])
{
  float scale = 100;
  int n = 10;
  float move_x = SCREEN_WIDTH / 2;
  float move_y = SCREEN_HEIGHT / 2;
  float alpha = 0, beta = 0;
  int mouse_x = SCREEN_WIDTH / 2;
  int mouse_y = SCREEN_HEIGHT / 2;
  int vertices = 3;
  float diff_x = 0, diff_y;
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
            case SDL_SCANCODE_KP_7:
              alpha += 0.1;
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_KP_9:
              alpha -= 0.1;
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_UP:
              move_y -= 5;
              alpha += beta;
              beta = 0;

              move_x += round(diff_x);
              move_y += round(diff_y);
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_DOWN:
              move_y += 5;
              alpha += beta;
              beta = 0;

              move_x += round(diff_x);
              move_y += round(diff_y);
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_LEFT:
              move_x -= 5;
              alpha += beta;
              beta = 0;

              move_x += round(diff_x);
              move_y += round(diff_y);
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_RIGHT:
              move_x += 5;
              alpha += beta;
              beta = 0;

              move_x += round(diff_x);
              move_y += round(diff_y);
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_KP_3:
              scale += 2;
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_KP_1:
              if (scale <= 0)
                continue;
              else {
                scale -= 2;
                clear_screen(loadedSurface);
              }
              break;
            case SDL_SCANCODE_KP_8:
              n += 1;
              clear_screen(loadedSurface);
              printf("%d\n", n);
              break;
            case SDL_SCANCODE_KP_5:
              if (n == 0)
                continue;
              else {
                n -= 1;
                clear_screen(loadedSurface);
                printf("%d\n", n);
              }
              break;
            case SDL_SCANCODE_KP_MINUS:
              if (vertices <= 3)
                continue;
              else {
                vertices -= 1;
                clear_screen(loadedSurface);
              }
              break;
            case SDL_SCANCODE_KP_PLUS:
              vertices += 1;
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_KP_4:
              beta += 0.1;
              clear_screen(loadedSurface);
              break;
            case SDL_SCANCODE_KP_6:
              beta -= 0.1;
              clear_screen(loadedSurface);
              break;
            default:
              break;
            }
          }
          if (e.type == SDL_MOUSEBUTTONDOWN) {
            SDL_GetMouseState(&mouse_x, &mouse_y);
            alpha += beta;
            beta = 0;

            move_x += round(diff_x);
            move_y += round(diff_y);

            diff_x = 0;
            diff_y = 0;
            clear_screen(loadedSurface);
          }
          (float)mouse_x;
          (float)mouse_y;
        }
        SDL_RenderClear(gRenderer);

        draw(loadedSurface, mouse_x, mouse_y, vertices, scale, move_x, move_y, n, alpha, beta, diff_x, diff_y);

        SDL_UpdateTexture(gTexture, NULL, loadedSurface->pixels, loadedSurface->pitch);
        SDL_RenderCopy(gRenderer, gTexture, NULL, NULL);
        SDL_RenderPresent(gRenderer);
      }
    }
  }
  close();
  return 0;
}
