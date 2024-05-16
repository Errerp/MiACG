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

void convert_coordinates(float q, struct Point *points, int vertices)
{
  struct Point *new_points = (struct Point *)malloc(vertices * sizeof(struct Point));

  for (int i = 0; i < vertices; i++) {
    new_points[i].x = (1 - q) * points[i % vertices].x + q * points[(i + 1) % vertices].x;
    new_points[i].y = (1 - q) * points[i % vertices].y + q * points[(i + 1) % vertices].y;
  }

  for (int i = 0; i < vertices; i++) {
    points[i].x = new_points[i].x;
    points[i].y = new_points[i].y;
  }
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

    float f_x, f_y;
    f_x = move_x;
    f_y = move_y;

    points[i].x -= mouse_x;
    points[i].y -= mouse_y;
    f_x -= mouse_x;
    f_y -= mouse_y;

    rotate_x = points[i].x * cos(beta) + points[i].y * sin(beta);
    rotate_y = -points[i].x * sin(beta) + points[i].y * cos(beta);
    points[i].x = rotate_x;
    points[i].y = rotate_y;

    rotate_x = f_x * cos(beta) + f_y * sin(beta);
    rotate_y = -f_x * sin(beta) + f_y * cos(beta);
    f_x = rotate_x;
    f_y = rotate_y;

    points[i].x += mouse_x;
    points[i].y += mouse_y;
    f_x += mouse_x;
    f_y += mouse_y;

    diff_x = f_x - move_x;
    diff_y = f_y - move_y;
  }
}

void draw_figure(SDL_Surface *s, struct Point *points, int vertices)
{
  for (int i = 0; i < vertices; i++) {
    for (float t = 0; t <= 1; t += 0.001) {
      float x = (points[(i + 1) % vertices].x - points[i % vertices].x) * t + points[i % vertices].x;
      float y = (points[(i + 1) % vertices].y - points[i % vertices].y) * t + points[i % vertices].y;
      put_pixel32(s, x, y, RGB32(200, 100, 200));
    }
  }
}

void draw(SDL_Surface *s, float mouse_x, float mouse_y, int vertices, float scale, float move_x, float move_y, int n, float alpha, float beta, float &diff_x, float &diff_y)
{
  draw_axis(s);

  struct Point *points = (struct Point *)malloc(vertices * sizeof(struct Point));

  for (int i = 0; i < vertices; i++) {
    points[i].x = scale * cos(2 * M_PI * i / vertices);
    points[i].y = scale * sin(2 * M_PI * i / vertices);
  }

  affine_transform(points, mouse_x, mouse_y, vertices, move_x, move_y, alpha, beta, diff_x, diff_y);

  draw_figure(s, points, vertices);

  for (int i = 1; i <= n; i++) {
    float q = tan((i - 1) * M_PI / (4 * (n - 1))) / (tan((i - 1) * M_PI / (4 * (n - 1))) + 1);
    convert_coordinates(q, points, vertices);

    draw_figure(s, points, vertices);
  }
}
