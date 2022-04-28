//basic_FlagLaos.pde
//Draw the Laos flag
//2022/04/18
//1-4-45 Taiyu Honma
void setup(){
  background(10,10,125);
  size(600,400);
  noStroke();
  fill(255,255,255);
  circle(width/2,height/2,150);
  fill(200,50,50);
  rect(0,0,width,height/4);
  rect(0,height/4*3,width,height/4);
}
