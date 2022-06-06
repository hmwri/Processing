//basic_ColorfulBall
//make a color ball
//2022/05/16
//1-4-45 Taiyu Honma

void setup()
{
  size(400,300);
}
int x = (int)random(0,400);
int y = (int)random(0,300);
int dx = 3;
int dy = 2;
int colornum = 0;
void draw(){
  background(255);
  x += dx;
  y += dy;
  if(x > 400 || x < 0){
    dx*=-1;
    colornum++;
  }
  if(y > 300 || y < 0){
    dy*=-1;
    colornum++;
  }
  if(colornum % 3 == 0){
    fill(0,255,0);
  }
  if(colornum % 3 == 1){
    fill(255,255,0);
  }
  if(colornum % 3 == 2){
    fill(255,0,0);
  }
  ellipse(x,y,30,30);
}
