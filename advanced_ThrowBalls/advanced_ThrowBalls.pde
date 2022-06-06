//advanced_ThrowBalls
//Draw the throw ball
//2022/05/09
//1-4-45 Taiyu Honma
void setup(){
  background(255);
  size(1300,400);
}
float h = 400;
float t = 0;
float g = 9.8;
float theta = radians(30);
void draw(){
  
  stroke(200);
  for(int i=0;i<13;i++){
    line(i*100,0,i*100,400);
  }
  noStroke();
  fill(255,0,0);
  ball(50);
  fill(0,255,0);
  ball(70);
  fill(0,0,255);
  ball(100);
  t+=0.1;
}

void ball(float v0){
  float x = v0*cos(theta)*t;
  float y = v0*sin(theta)*t - (1.0/2.0)*g*t*t +300;
  circle(x,h-y,8);
  
  
}
