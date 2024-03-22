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

void draw(SDL_Surface *s, float a, float b, float x_move , float y_move,float alpha )
{
  glm::vec4 Position = glm::vec4(glm::vec3(0.0f), 1.0f);
  glm::mat4 Model = glm::translate(glm::mat4(1.0f), glm::vec3(1.0f));
  glm::vec4 Transformed = Model * Position;

  for (int i = 0; i < SCREEN_WIDTH; i++){
    put_pixel32(s, i, SCREEN_HEIGHT/2, RGB32(100, 100, 100));
  }
  for (int j = 0; j < SCREEN_HEIGHT; j++){
    put_pixel32(s, SCREEN_WIDTH/2, j, RGB32(100, 100, 100));
  }

  for (float phi = -100; phi < 2 * M_PI; phi += 0.01) {
      float x = x_move + b * cos(phi);
      float y = b * sin(phi) + y_move;
      if (y >= 0 && y < SCREEN_HEIGHT && x >= 0 && x < SCREEN_WIDTH)
        put_pixel32(s, x, y, RGB32(0, 0, 100));
  }

  for (float phi = -100; phi < 100; phi += 0.01) {
    float x = (a + b) * cos(phi) - a * cos(((a + b) * phi) / a);
    float y = (a + b) * sin(phi) - a * sin(((a + b) * phi) / a);

    float x_rotate = x * cos(alpha) + y * sin(alpha);
    float y_rotate = -x * sin(alpha) + y * cos(alpha);

    int xr = x_move + x_rotate;
    int yr = y_move + y_rotate;


    if (yr >= 0 && yr < SCREEN_HEIGHT && xr >= 0 && xr < SCREEN_WIDTH)
      put_pixel32(s, xr, yr, RGB32(0, 255, 0));
  }
}
