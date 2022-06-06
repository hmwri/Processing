//basic_CircleArea
//Draw the circleArea
//2022/05/09
//1-4-45 Taiyu Honma
void setup(){
  size(500,500);
}
void draw(){
  background(255);
  fill(255);
  float r = sqrt(pow(mouseX-250,2)+pow(mouseY-250,2));
  float s = r*r*PI;
  circle(250,250,r*2);
  line(250,250,mouseX,mouseY);
  fill(0);
  text("r = "+r,50,100);
  text("S = "+s,350,100);
}
