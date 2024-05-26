#pragma once
#include <SDL.h>
#include <math.h>
#include <cassert>
#include <iostream>
const int INSIDE = 0;// 0000
const int LEFT = 1;// 0001
const int RIGHT = 2;// 0010
const int BOTTOM = 4;// 0100
const int TOP = 8;// 1000

//Screen dimension constants
const int SCREEN_WIDTH = 640;
const int SCREEN_HEIGHT = 480;

void draw_n(SDL_Surface *s, int coverage, float scale, float move_x, float move_y, int num, float R, float a, float centerx, float centery, float alpha, int flag, int **arr, float nu, int flag2, float rotationx, float rotationy, double X_MIN, double X_MAX, double Y_MIN, double Y_MAX);
void draw(SDL_Surface *s, int coverage, float scale, float move_x, float move_y, float nu, int num, float R, float a, float centerx, float centery, float alpha, float rotationx, float rotationy);
