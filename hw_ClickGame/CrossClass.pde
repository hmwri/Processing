class CrossClass extends ObjectBase {
  int length = 20;
  int range = 20;
  CrossClass() {
    super();
    vx = random(-1,1);
  }
  void move() {
    x += vx;
    y += vy;
    vx += random(-1.0 ,1.0 );
    vx = min(5.0,vx);
    vx = max(-5.0,vx);
    if (x > width) x = 0;
    if (x < 0) x = width;
    if (y < 0) y = height;
    if (y > height) y = 0;
  }
  void display() {
    if(!active) return;
    strokeWeight(3);
    stroke(0, 255, 0);
    line(x + length, y+length, x-length, y-length);
    line(x + length, y-length, x - length, y +length);
  }
  void isClicked()
  {
    if (active && x - range < mouseX && mouseX < x + range && mouseY > y - range && mouseY < y + range) {
      this.active = false;
    }
  }
}
