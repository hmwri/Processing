//basic_FourAreas.pde
//Draw the four areas separated mouse position
//2022/04/25
//1-4-45 Taiyu Honma

void setup(){
  size(600,400);
}

void draw(){
  color red = color(255,0,0);
  color blue = color(0,255,0);
  color green = color(0,0,255);
  color yellow = color( #FFF100 );
  rectMode(CORNERS);
  background(255);
  int w = 600;
  int h = 400;
  
  fill(yellow);
  rect(0,0,mouseX,mouseY);
  
  fill(green);
  rect(mouseX,mouseY,w,0);
  fill(blue);
  rect(mouseX,mouseY,0,h);
  fill(red);
  rect(mouseX,mouseY,w,h);
}
