class SquareClass extends ObjectBase {
  float w;
  SquareClass(int sx, int sy) {
    super(sx, sy);
    w = random(10, 40);
    d = w/2;
  }
  void display() {
    noStroke();
    fill(c);
    rect(x-w/2, y-w/2, w, w);
  }
  void move() {
    super.move();
        if (x > width) x = 0;
    if (x < 0) x = width;
    if (y < 0) y = height;
    if (y > height) y = 0;

  }
}
