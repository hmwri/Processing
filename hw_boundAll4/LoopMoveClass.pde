class LoopMove extends Object {
  LoopMove() {
    super();
  }
  void draw() {
    super.draw();
    if (x > width) x = 0;
    if (x < 0) x = width;
    if (y < 0) y = height;
    if (y > height) y = 0;
  }
}
