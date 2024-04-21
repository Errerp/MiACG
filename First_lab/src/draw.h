#pragma once
#include <SDL.h>
#include <cassert>

//Screen dimension constants
const int SCREEN_WIDTH = 1920;
const int SCREEN_HEIGHT = 1080;

void draw(SDL_Surface *s, float a, float b, float x_move , float y_move,  float alpha, float beta, float rotate_x, float rotate_y, float &diff_x, float &diff_y);
