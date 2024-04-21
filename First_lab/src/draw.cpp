#include "draw.h"

#include <glm/glm.hpp>
#include <glm/ext.hpp>

#define RGB32(r, g, b) static_cast<uint32_t>((((static_cast<uint32_t>(b) << 8) | g) << 8) | r)

void put_pixel32(SDL_Surface *surface, int x, int y, Uint32 pixel)
{
  assert(NULL != surface);
  assert(x < SCREEN_WIDTH);
  assert(y < SCREEN_HEIGHT);

  Uint32 *pixels = (Uint32 *)surface->pixels;
  pixels[(y * surface->w) + x] = pixel;
}

Uint32 get_pixel32(SDL_Surface *surface, int x, int y)
{
  assert(NULL != surface);
  assert(x < SCREEN_WIDTH);
  assert(y < SCREEN_HEIGHT);

  Uint32 *pixels = (Uint32 *)surface->pixels;
  return pixels[(y * surface->w) + x];
}

void draw_axises(SDL_Surface *s)
{
  for (int i = 0; i < SCREEN_WIDTH; i++) {
    put_pixel32(s, i, SCREEN_HEIGHT / 2, RGB32(200, 200, 200));
  }
  for (int j = 0; j < SCREEN_HEIGHT; j++) {
    put_pixel32(s, SCREEN_WIDTH / 2, j, RGB32(200, 200, 200));
  }
}

void equalize(float &first_x, float &first_y, float x, float y)
{
  first_x = x;
  first_y = y;
}

void minus(float &first_x, float &first_y, float x, float y)
{
  first_x -= x;
  first_y -= y;
}

void plus(float &first_x, float &first_y, float x, float y)
{
  first_x += x;
  first_y += y;
}

void move(float &x, float &y, float x_move, float y_move)
{
  x += x_move;
  y += y_move;
}

void spin(float &x, float &y, float alpha)
{
  float x_spin = x * cos(alpha) + y * sin(alpha);
  float y_spin = -x * sin(alpha) + y * cos(alpha);

  x = x_spin;
  y = y_spin;
}

void spin_around_point(float &x, float &y, float x_move, float y_move, float beta, float rotate_x, float rotate_y, float &diff_x, float &diff_y)
{
  float first_x, first_y, second_x, second_y;
  equalize(first_x, first_y, x_move, y_move);
  equalize(second_x, second_y, x_move, y_move);

  minus(x, y, rotate_x, rotate_y);
  minus(first_x, first_y, rotate_x, rotate_y);

  spin(x, y, beta);

  spin(first_x, first_y, beta);

  plus(x, y, rotate_x, rotate_y);
  plus(first_x, first_y, rotate_x, rotate_y);

  diff_x = first_x - second_x;
  diff_y = first_y - second_y;
}

void draw_circle(SDL_Surface *s, float a, float b, float x_move, float y_move, float alpha, float beta, float rotate_x, float rotate_y, float &diff_x, float &diff_y)
{
  for (float phi = -100; phi < 2 * M_PI; phi += 0.01) {
    float x = b * cos(phi);
    float y = b * sin(phi);

    spin(x, y, alpha);

    move(x, y, x_move, y_move);

    spin_around_point(x, y, x_move, y_move, beta, rotate_x, rotate_y, diff_x, diff_y);

    if (y >= 0 && y < SCREEN_HEIGHT && x >= 0 && x < SCREEN_WIDTH)
      put_pixel32(s, x, y, RGB32(0, 0, 200));
  }
}

void draw_epicycloids(SDL_Surface *s, float a, float b, float x_move, float y_move, float alpha, float beta, float rotate_x, float rotate_y, float &diff_x, float &diff_y)
{
  for (float phi = -100; phi < 100; phi += 0.001) {
    float x = (a + b) * cos(phi) - a * cos(((a + b) * phi) / a);
    float y = (a + b) * sin(phi) - a * sin(((a + b) * phi) / a);

    spin(x, y, alpha);

    move(x, y, x_move, y_move);

    spin_around_point(x, y, x_move, y_move, beta, rotate_x, rotate_y, diff_x, diff_y);

    if (y >= 0 && y < SCREEN_HEIGHT && x >= 0 && x < SCREEN_WIDTH)
      put_pixel32(s, x, y, RGB32(0, 255, 0));
  }
}

void draw(SDL_Surface *s, float a, float b, float x_move, float y_move, float alpha, float beta, float rotate_x, float rotate_y, float &diff_x, float &diff_y)
{
  glm::vec4 Position = glm::vec4(glm::vec3(0.0f), 1.0f);
  glm::mat4 Model = glm::translate(glm::mat4(1.0f), glm::vec3(1.0f));
  glm::vec4 Transformed = Model * Position;

  draw_axises(s);

  draw_circle(s, a, b, x_move, y_move, alpha, beta, rotate_x, rotate_y, diff_x, diff_y);

  draw_epicycloids(s, a, b, x_move, y_move, alpha, beta, rotate_x, rotate_y, diff_x, diff_y);
}
