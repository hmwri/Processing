//advanced_Action
//draw circle action
//2022/05/23
//1-4-45 Taiyu Honma
void setup(){
  size(800,400);
}

float x = 400;
float y = 250;
float vx = 0;
float vy = 0;
float t = 0;
float g = 2.0;
float v0 = 30.0;
boolean jump = false;
void draw(){
  background(200,200,255);
  noStroke();
  rect(0,300,800,100);
  ellipse(x,y,100,100);
  x+=vx;
  if(jump){
    y-=(v0  - g*t);
    t++;
  }
  if(y > 250){
    y = 250;
    t = 0;
    jump = false;
  }
  if(x < 0){
    x = 800;
  }
  if(x > 800){
    x = 0;
  }
}

void keyPressed(){
  switch (keyCode){
    case RIGHT:
      vx++;
      break;
    case LEFT:
      vx--;
      break;
    case UP:
      jump = true;
    
  }
}
