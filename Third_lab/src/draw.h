#pragma once
#include <SDL.h>
#include <cassert>

// Размеры экрана
const int SCREEN_WIDTH = 1920;
const int SCREEN_HEIGHT = 1080;

struct Point
{
  float x;
  float y;
};

struct Square
{
  float x;
  float y;
};

void affine_transform(struct Point *points, float mouse_x, float mouse_y, int vertices, float move_x, float move_y, float alpha, float beta, float &diff_x, float &diff_y);
void draw(SDL_Surface *s, float mouse_x, float mouse_y, int vertices, float scale, float move_x, float move_y, float alpha, float beta, float &diff_x, float &diff_y, float scale_sq);
void draw_figure(SDL_Surface *s, struct Point *points, struct Square *square, int vertices);
