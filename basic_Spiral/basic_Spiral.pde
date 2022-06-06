//basic_Spiral.pde
//Draw the spiral
//2022/05/09
//1-4-45 Taiyu Honma
void setup(){
  size(800,800);
}
float theta = 0;
float a = 0.1;
float b =400;
float c= 400;
void draw(){
  fill(0);
  float x = a*theta*cos(radians(theta)) + b;
  float y = a*theta*sin(radians(theta)) + c;
  ellipse(x,y,3,3);
  theta+=2;
  
}
