//advanced_FlagZA.pde
//Draw the ZA flag
//2022/04/18
//1-4-45 Taiyu Honma
void setup(){
  background(color(#001C83));
  size(600,400);
  noStroke();
  fill(color(#D04A3B));
  rect(0,0,width,height/2);
  fill(255);
  int whiteH  = 130;
  rect(0,height/2-whiteH/2,width,whiteH);
  triangle(0,-70,0,height+70,450,height/2);
  fill(color(#33744D));
  int greenH = 80; 
  rect(0,height/2-greenH/2,width,greenH);
  triangle(0,-35,0,height+35,395,height/2);
  fill(color(#F5B947));
  triangle(0,50,0,height-50,240,height/2);
  fill(0);
  triangle(0,80,0,height-80,190,height/2);
}
