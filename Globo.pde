class Globo
{
  float _d, _x, _y, _vx, _vy;
  color _col;
  Globo(float diametro, color col, float x, float y, float vx, float vy)
  {
    _d = diametro;
    _col = col;
    _x = x;
    _y = y;
    _vx = vx;
    _vy = vy;
  }
  void update()
  {
    _vy -= random(0.02, 0.05);
    _vx += random(-0.1, 0.1);
    _x = _x + _vx;
    _y = _y + _vy;
  }
  void draw()
  {
    push();
    fill(_col);
    translate(_x, _y);
    ellipse(0, 0, _d,_d);
    translate(0,_d/2+5);
    triangle(0,-5,-5,0,5,0);
    pop();
  }
}
