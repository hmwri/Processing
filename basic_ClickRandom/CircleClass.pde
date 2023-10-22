class CircleClass extends ObjectBase{
  float r;
  CircleClass(int sx, int sy) {
    super(sx,sy);
    r = random(5,60);
    d = r/2;
    c = color(255,0,0);
  }
  void display(){
    noStroke();
    fill(255,0,0);
    fill(c);
    ellipse(x,y,r,r);
  }
  void move(){
    super.move();
    x = min(width-d,x);
    y = min(height-d,y);
    x = max(x,d);
    y = max(y,d);
    if(x == width-d || x == d){
      vx = -vx;
    }
    if(y == height-d || y == d){
      vy = -vy;
    }
  }
}
