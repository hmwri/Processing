// Taiyu Honma
// 2620220526
// 2023/4/11
// drawing bouncing ball


int w = 800;
int h = 800;
ArrayList<ball> balls = new ArrayList<ball>();

void setup(){
  size(800,800);
  int s = 10;
  for(int i=0;i < 10;i++){
  balls.add(
  new ball((int)random(0,height),(int)random(0,height), (int)random(-s,s),(int)random(-s,s))
  );
  }
}

void draw(){
  background(255);
  fill(255,30,30);
  for(ball b : balls){
    b.draw();
  }
}
class ball{
  int x, y;
  int vx,vy;
  int r = 50;
  ball(int sx, int sy, int svx, int svy){
    x = sx;
    y = sy;
    vx = svx;
    vy = svy;
  }
  void draw(){
    ellipse(x,y, r,r);
    x += vx;
    y += vy;
    if(x> width-r/2 ||  x< r/2){
      x = constrain(x,r/2,width-r/2);
      vx = -vx;
    }

    if(y > height-r/2 || y < r/2){
      y = constrain(y,r/2,width-r/2);
      vy = -vy;
    }
  }
}
