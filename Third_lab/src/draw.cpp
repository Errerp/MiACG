#include "draw.h"

#include <glm/glm.hpp>
#include <glm/ext.hpp>

#define RGB32(r, g, b) static_cast<uint32_t>((((static_cast<uint32_t>(b) << 8) | g) << 8) | r)

void madeWindow(int first_window, double *X_MIN,
                double *X_MAX ,
                double *Y_MIN,
                double *Y_MAX )
{
  if (first_window == 0) {
     *X_MIN = 100;
     *X_MAX = 300;
     *Y_MIN = 150;
     *Y_MAX = 250;
  } else if (first_window == 1) {
     *X_MIN = 130;
     *X_MAX = 450;
     *Y_MIN = 40;
     *Y_MAX = 300;
  }
  else if (first_window == 2)
  {
     *X_MIN =300;
     *X_MAX = 400;
     *Y_MIN = 300;
     *Y_MAX = 400;
  }
}

void multiplyMatrix(const double matrix[3][3], float *x,float *y)
{
  double newX = matrix[0][0] * *x + matrix[0][1] * *y + matrix[0][2] * 1;
  double newY = matrix[1][0] * *x + matrix[1][1] * *y + matrix[1][2] * 1;
  *x = newX;
  *y = newY;
}

void translatePoint(float *x,float *y, double move_x, double move_y){
  float x1=*x, y1=*y;
  double translateMatrix[3][3] = {
    { 1, 0, move_x },
    { 0, 1, move_y },
    { 0, 0, 1 }
  };
  multiplyMatrix(translateMatrix,&x1,&y1 );
  *x = x1;
  *y = y1;

}

// Функция для вращения точки относительно произвольной точки на заданный угол
void rotatePointAround(float *x,float *y, float centerx,float centery, double angle)
{
  float x1 = *x, y1 = *y;
  // Сдвигаем точку так, чтобы центр вращения стал началом координат
  translatePoint(&x1, &y1, -centerx , -centery );

  // Выполняем вращение относительно нового начала координат
  double rotateMatrix[3][3] = {
    { cos(angle), sin(angle), 0 },
    { -sin(angle), cos(angle), 0 },
    { 0, 0, 1 }
  };
  multiplyMatrix(rotateMatrix,&x1,&y1 );

  // Возвращаем точку в исходное положение
  translatePoint(&x1, &y1, +centerx , +centery );
  *x = x1;
  *y = y1;
}

// Функция для масштабирования точки относительно начала координат
void scalePoint(float *x,float *y, double scale,float centerx,float centery)
{

  float x1 = *x, y1 = *y;
  translatePoint(&x1, &y1, -centerx, -centery);
  double scaleMatrix[3][3] = {
    { scale, 0, 0 },
    { 0, scale, 0 },
    { 0, 0, 1 }
  };
  multiplyMatrix(scaleMatrix, &x1,&y1);
  translatePoint(&x1, &y1, +centerx, +centery);
  *x = x1;
  *y = y1;
}
void moveFigureOnX(float *x1,float *y1,float *x2,float *y2)
{

    float move_x = 10;
    float move_y = 0.0f;
    translatePoint(x1, y1, move_x, move_y);// Первая точка
    translatePoint(x2, y2, move_x, move_y);// Вторая точка

}
// Функция для определения кода области точки
int computeCode(float x, float y, double X_MIN, double X_MAX, double Y_MIN, double Y_MAX)
{
  int code = INSIDE;// Изначально считаем точку внутри окна

  if (x < X_MIN)// слева от окна
    code |= LEFT;
  else if (x > X_MAX)// справа от окна
    code |= RIGHT;
  if (y < Y_MIN)// ниже окна
    code |= BOTTOM;
  else if (y > Y_MAX)// выше окна
    code |= TOP;

  return code;
}

void cohenSutherland(float *xstart, float *ystart, float *xend, float *yend, int *flag, double X_MIN, double X_MAX, double Y_MIN, double Y_MAX)
{
  int codeStart = computeCode(*xstart, *ystart,  X_MIN,  X_MAX, Y_MIN, Y_MAX);
  int codeEnd = computeCode(*xend, *yend,  X_MIN,  X_MAX, Y_MIN,  Y_MAX);
  int has_hanged = 0;

  bool accept = false;

  while (true) {
    if (codeStart == 0 && codeEnd == 0) {
      if (has_hanged==0)
        *flag = 1;
      else
        *flag = 3;
      accept = true;
      break;
    }
    else if (codeStart & codeEnd) {

      if (has_hanged == 0)
        *flag = 0;
      else
        *flag = 4;
      break;
    } else {
      int code = (codeStart != 0) ? codeStart : codeEnd;
      double x, y;
      if (code & TOP) {
        x = *xstart + (*xend - *xstart) * (Y_MAX - *ystart) / (*yend - *ystart);
        y = Y_MAX;
      } else if (code & BOTTOM) {
        x = *xstart + (*xend - *xstart) * (Y_MIN - *ystart) / (*yend - *ystart);
        y = Y_MIN;
      }
      else if (code & RIGHT) {
        y = *ystart + (*yend - *ystart) * (X_MAX - *xstart) / (*xend - *xstart);
        x = X_MAX;
      } else if (code & LEFT) {
        y = *ystart + (*yend - *ystart) * (X_MIN - *xstart) / (*xend - *xstart);
        x = X_MIN;
      }
        if (code == codeStart) {
          *xstart = x;
          *ystart = y;
          codeStart = computeCode(*xstart, *ystart,  X_MIN, X_MAX, Y_MIN, Y_MAX);
        } else {
          *xend = x;
          *yend = y;
          codeEnd = computeCode(*xend, *yend,  X_MIN,  X_MAX, Y_MIN, Y_MAX);
        }
        has_hanged = 1;
    }

  }


}
void put_pixel32(SDL_Surface *surface, int x, int y, Uint32 pixel)
{

  assert(NULL != surface);
  if ((x >= 0 && x <= 638) && (y >= 0 && y <= 478)) {
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

void line(SDL_Surface *s,int x1, int y1, int x2, int y2, int color)
{
  int move_x = abs(x2 - x1);
  int move_y = abs(y2 - y1);
  int sx = x2 >= x1 ? 1 : -1;
  int sy = y2 >= y1 ? 1 : -1;

  if (move_y <= move_x) {
    int d = (move_y << 1) - move_x;
    int d1 = move_y << 1;
    int d2 = (move_y - move_x)<<1;
    put_pixel32(s, x1, y1, color);

    for (int x = x1 + sx, y = y1, i = 1; i <= move_x; i++, x += sx) {
      if (d > 0) {
        d += d2;
        y += sy;
      } else
        d += d1;
      put_pixel32(s, x, y, color);
    }
  }
   else
  {
    int d = (move_x << 1) - move_y;
    int d1 = move_x << 1;
    int d2 = (move_x - move_y)<<1;
      put_pixel32(s, x1, y1, color);
    for (int x = x1, y = y1 + sy, i = 1; i <= move_y; i++, y += sy) {
      if (d > 0) {
        d += d2;
        x += sx;
      } else
        d += d1;
      put_pixel32(s, x, y, color);

    }
  }
}

void draw_c(SDL_Surface *s, float x1, float x2, float y1, float y2, int *flag1, int coverage, double X_MIN, double X_MAX, double Y_MIN, double Y_MAX)
{
    float tmp1 = x1, tmp2 = x2, tmp3 = y1, tmp4 = y2;
    cohenSutherland(&x1, &y1, &x2, &y2, flag1, X_MIN, X_MAX, Y_MIN, Y_MAX);
    if (coverage == 0)
    {
        if (*flag1 == 1)
            line(s, x1, y1, x2, y2, RGB32(200, 100, 200));
        if (*flag1 == 0)
        {
            for (float t = 0; t <= 1; t += 0.0001f)
            {
                x1 = (x2 - x1) * t + x1;
                y1 = (y2 - y1) * t + y1;
                if (static_cast<int>(t * 1000) % 2 == 0)
                    put_pixel32(s, x1, y1, RGB32(0, 0, 200));
            }
        }
        if (*flag1 == 3)
        {
            line(s, x1, y1, x2, y2, RGB32(200, 100, 200));
            for (float t = 0; t <= 1; t += 0.0001f)
            {
                tmp1 = (x1 - tmp1) * t + tmp1;
                tmp3 = (y1 - tmp3) * t + tmp3;
                if (static_cast<int>(t * 1000) % 2 == 0)
                    put_pixel32(s, tmp1, tmp3, RGB32(0, 0, 200));
            }
            for (float t = 0; t <= 1; t += 0.0001f)
            {
                tmp2 = (x2 - tmp2) * t + tmp2;
                tmp4 = (y2 - tmp4) * t + tmp4;
                if (static_cast<int>(t * 1000) % 2 == 0)
                    put_pixel32(s, tmp2, tmp4, RGB32(0, 0, 200));
            }
        }
        if (*flag1 == 4)
        {
            for (float t = 0; t <= 1; t += 0.0001f)
            {
                tmp1 = (tmp2 - tmp1) * t + tmp1;
                tmp3 = (tmp4 - tmp3) * t + tmp3;
                if (static_cast<int>(t * 1000) % 2 == 0)
                    put_pixel32(s, tmp1, tmp3, RGB32(0, 0, 200));
            }
        }
    }
    else
    {
        if (*flag1 == 1)
        {
            for (float t = 0; t <= 1; t += 0.0001f)
            {
                x1 = (x2 - x1) * t + x1;
                y1 = (y2 - y1) * t + y1;
                if (static_cast<int>(t * 1000) % 2 == 0)
                    put_pixel32(s, x1, y1, RGB32(0, 0, 200));
            }
        }

        if (*flag1 == 0)
        {
            line(s, x1, y1, x2, y2, RGB32(200, 100, 200));
        }
        if (*flag1 == 3)
        {
            line(s, tmp1, tmp3, x1, y1, RGB32(200, 100, 200));
            line(s, tmp2, tmp4, x2, y2, RGB32(200, 100, 200));
            for (float t = 0; t <= 1; t += 0.0001f)
            {
                x1 = (x2 - x1) * t + x1;
                y1 = (y2 - y1) * t + y1;
                if (static_cast<int>(t * 1000) % 2 == 0)
                    put_pixel32(s, x1, y1, RGB32(0, 0, 200));
            }
        }
        if (*flag1 == 4)
        {
            line(s, tmp1, tmp3, tmp2, tmp4, RGB32(200, 100, 200));
        }
    }
}

void draw_n(SDL_Surface *s, int coverage, float scale, float move_x, float move_y, int num, float R, float a, float *centerx, float *centery, float alpha, int flag, int **arr, float nu, int flag2, float rotationx, float rotationy, double X_MIN, double X_MAX, double Y_MIN, double Y_MAX)
{
  int flag1 = 10;
  for (int i = 0; i < num; i++) {
    double angle = 4 * M_PI * i / num;
    float x1 = R * cos(angle) + *centerx;
    float y1 = R * sin(angle) + *centery;
    arr[i][0] = x1;
    arr[i][1] = y1;
    angle = 4 * M_PI * (i + 1) / num;
    float x2 = R * cos(angle) + *centerx;
    float y2 = R * sin(angle) + *centery;
    translatePoint(&x1, &y1, move_x, move_y);
    rotatePointAround(&x1, &y1, rotationx, rotationy, alpha);
    scalePoint(&x1, &y1, scale, *centerx + move_x, *centery + move_y);
    translatePoint(&x2, &y2, move_x, move_y);
    rotatePointAround(&x2, &y2, rotationx, rotationy, alpha);
    scalePoint(&x2, &y2, scale, *centerx + move_x, *centery + move_y);
    draw_c(s, x1, x2, y1, y2, &flag1, coverage, X_MIN, X_MAX, Y_MIN, Y_MAX);
    }
}

void draw_axis(SDL_Surface *s){

  for (int i = 0; i < SCREEN_WIDTH; i++)
    put_pixel32(s, i, SCREEN_HEIGHT / 2,  RGB32(105, 105, 105));

  for (int j = 0; j < SCREEN_HEIGHT; j++)
    put_pixel32(s, SCREEN_WIDTH / 2, j,  RGB32(105, 105, 105));
}

void draw_content(SDL_Surface *s, int first_window, double X_MIN, double X_MAX, double Y_MIN, double Y_MAX)
{
  for (int i = X_MIN; i < X_MAX; i++)
    put_pixel32(s, i, Y_MIN, RGB32(0, 200, 200));
  for (int i = X_MIN; i < X_MAX; i++)
    put_pixel32(s, i, Y_MAX, RGB32(0, 200, 200));
  for (int j = Y_MIN; j < Y_MAX; j++)
    put_pixel32(s, X_MIN, j, RGB32(0, 200, 200));
  for (int j = Y_MIN; j < Y_MAX; j++)
    put_pixel32(s, X_MAX, j, RGB32(0, 200, 200));
}

void draw(SDL_Surface *s, int coverage, float scale, float move_x, float move_y, float nu, int num, float R, float a, float centerx, float centery, float alpha, float rotationx, float rotationy)
{
  draw_axis(s);
  double X_MIN = 200, X_MAX = 500, Y_MIN = 100, Y_MAX = 400;
  madeWindow(0, &X_MIN, &X_MAX, &Y_MIN, &Y_MAX);
  draw_content(s, 0, X_MIN, X_MAX, Y_MIN, Y_MAX);
  int **arr = new int *[num];
  for (int i = 0; i < num; i++) {
    arr[i] = new int[2];
  }

  draw_n(s, coverage, scale, move_x, move_y, num, R, a, &centerx, &centery, alpha, 1, arr, nu, 0, rotationx, rotationy, X_MIN, X_MAX, Y_MIN, Y_MAX);
  }
