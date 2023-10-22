class TriangleClass extends ObjectBase {
  TriangleClass() {
    super();
  }
  void move(){
    x += vx;
    y += vy;
    if (x > width) x = 0;
    if (x < 0) x = width;
    if (y < 0) y = height;
    if (y > height) y = 0;

  }
  void display(){
    noStroke();
    fill(color(0));
    triangle(x,y-20,x-20,y+20,x+20,y+20);
  }
}
