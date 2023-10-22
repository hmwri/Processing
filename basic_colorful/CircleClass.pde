class CircleClass extends movingObject{
  float r = 15;
  CircleClass() {
    super();
    d = r;
  }
  void draw(){
    fill(255,0,0);
    super.draw();
    fill(c);
    ellipse(x,y,r*2,r*2);
  }
}

class movingObject {
  float x;
  float y;
  float vx;
  float vy;
  float d;
  color c;
  movingObject(){
    x = random(width);
    y = random(height);
    vx = random(-5,5);
    vy = random(-5,5);
    c = color(random(255),random(255),random(255));
  }
  void draw(){
    x += vx;
    y -= vy;
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
