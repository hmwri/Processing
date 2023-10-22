class SquareClass extends movingObject{
  float w = 30;
  SquareClass() {
    super();
    d = w/2;
    vx = random(-20,20);
    vy = random(-20,20);
    c = color(0,0,255);
  }
  void draw(){
    
    noStroke();
    fill(0,0,255);
    super.draw();
    rect(x-w/2,y-w/2,w,w);
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
