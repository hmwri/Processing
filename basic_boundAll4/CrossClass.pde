class CrossClass extends ObjectBase{
  int length = 20;
  CrossClass() {
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
       strokeWeight(3);
    stroke(0,255,0);
        line(x + length,y+length,x-length,y-length);
    line(x + length,y-length,x - length,y +length);
  }
}
