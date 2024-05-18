#include "draw.h"

#include <glm/glm.hpp>
#include <glm/ext.hpp>

#define RGB32(r, g, b) static_cast<uint32_t>((((static_cast<uint32_t>(b) << 8) | g) << 8) | r)

void put_pixel32(SDL_Surface *surface, int x, int y, Uint32 pixel)
{
  if ((x > 0 && x < SCREEN_WIDTH) && (y > 0 && y < SCREEN_HEIGHT)) {
    Uint32 *pixels = (Uint32 *)surface->pixels;
    pixels[(y * surface->w) + x] = pixel;
  }
}

Uint32 get_pixel32(SDL_Surface *surface, int x, int y)
{
  assert(NULL != surface);
  assert(x < SCREEN_WIDTH);
  assert(y < SCREEN_HEIGHT);

  Uint32 *pixels = (Uint32 *)surface->pixels;
  return pixels[(y * surface->w) + x];
}

void draw_axis(SDL_Surface *s)
{
  for (int i = 0; i < SCREEN_WIDTH; i++)
    put_pixel32(s, i, SCREEN_HEIGHT / 2, RGB32(105, 105, 105));

  for (int j = 0; j < SCREEN_HEIGHT; j++)
    put_pixel32(s, SCREEN_WIDTH / 2, j, RGB32(105, 105, 105));
}

void affine_transform(struct Point *points, float mouse_x, float mouse_y, int vertices, float move_x, float move_y, float alpha, float beta, float &diff_x, float &diff_y)
{
  for (int i = 0; i < vertices; i++) {
    float rotate_x = points[i].x * cos(alpha) + points[i].y * sin(alpha);
    float rotate_y = -points[i].x * sin(alpha) + points[i].y * cos(alpha);
    points[i].x = rotate_x;
    points[i].y = rotate_y;

    points[i].x += move_x;
    points[i].y += move_y;

    float temp_x = move_x;
    float temp_y = move_y;

    points[i].x -= mouse_x;
    points[i].y -= mouse_y;
    temp_x -= mouse_x;
    temp_y -= mouse_y;

    rotate_x = points[i].x * cos(beta) + points[i].y * sin(beta);
    rotate_y = -points[i].x * sin(beta) + points[i].y * cos(beta);
    points[i].x = rotate_x;
    points[i].y = rotate_y;

    rotate_x = temp_x * cos(beta) + temp_y * sin(beta);
    rotate_y = -temp_x * sin(beta) + temp_y * cos(beta);
    temp_x = rotate_x;
    temp_y = rotate_y;

    points[i].x += mouse_x;
    points[i].y += mouse_y;
    temp_x += mouse_x;
    temp_y += mouse_y;

    diff_x = temp_x - move_x;
    diff_y = temp_y - move_y;
  }
}

void draw_figure(SDL_Surface *s, struct Point *points, struct Square *square, int vertices)
{
  for (int i = 0; i < vertices; i++) {
    for (float t = 0; t <= 1; t += 0.001) {
      float x = (points[(i + 1) % vertices].x - points[i % vertices].x) * t + points[i % vertices].x;
      float y = (points[(i + 1) % vertices].y - points[i % vertices].y) * t + points[i % vertices].y;

      bool is_inside_square = true;
      for (int j = 0; j < 4; j++) {
        if (j < 3) {
          if ((square[j + 1].y - square[j].y) * x - (square[j + 1].x - square[j].x) * y - square[j].x * square[j + 1].y + square[j + 1].x * square[j].y > 0) {
            is_inside_square = false;
            break;
          }
        } else {
          if ((square[0].y - square[j].y) * x - (square[0].x - square[j].x) * y - square[j].x * square[0].y + square[0].x * square[j].y > 0) {
            is_inside_square = false;
            break;
          }
        }
      }

      if (is_inside_square) {
        t += 0.025;
        put_pixel32(s, x, y, RGB32(0, 0, 200));// внутри квадрата
      } else {
        if (t < 1) {
          put_pixel32(s, x, y, RGB32(200, 100, 200));
        }
      }
    }
  }
}

void draw(SDL_Surface *s, float mouse_x, float mouse_y, int vertices, float scale, float move_x, float move_y, float alpha, float beta, float &diff_x, float &diff_y, float scale_sq)
{
  draw_axis(s);

  struct Point *points = (struct Point *)malloc(vertices * sizeof(struct Point));
  struct Square *square = (struct Square *)malloc(4 * sizeof(struct Square));

  for (int i = 0; i < vertices; i++) {
    points[i].x = scale * cos(4 * M_PI * i / vertices);
    points[i].y = scale * sin(4 * M_PI * i / vertices);
  }

  for (int i = 0; i < 4; i++) {
    square[i].x = scale_sq * cos(2 * M_PI * i / 4);
    square[i].y = scale_sq * sin(2 * M_PI * i / 4);
    float rotate_x = square[i].x * cos(M_PI / 4) + square[i].y * sin(M_PI / 4);
    float rotate_y = -square[i].x * sin(M_PI / 4) + square[i].y * cos(M_PI / 4);
    square[i].x = rotate_x;
    square[i].y = rotate_y;
    square[i].x += SCREEN_WIDTH / 2 - 150;
    square[i].y += SCREEN_HEIGHT / 2;
  }

  for (int i = 0; i < 4; i++) {
        for (float t = 0; t <= 1; t += 0.001) {

      float x = (square[(i + 1) % 4].x - square[i % 4].x) * t + square[i % 4].x;
      float y = (square[(i + 1) % 4].y - square[i % 4].y) * t + square[i % 4].y;
      put_pixel32(s, x, y, RGB32(0, 200, 200));
    }
  }

  affine_transform(points, mouse_x, mouse_y, vertices, move_x, move_y, alpha, beta, diff_x, diff_y);

  draw_figure(s, points, square, vertices);
}
