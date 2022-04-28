//advanced_Illusion.pde
//Draw the illusion
//2022/04/25
//1-4-45 Taiyu Honma
void setup(){
  size(255,255);
}

void draw()
{
  
  fill(0);
  ellipse(63,127,60,60);
  fill(mouseY);
  ellipse(190,127,60,60);
  fill(mouseX);
  ellipse(63,127,30,30);
 
  ellipse(190,127,30,30);
}
