//basic_CafeWall
//draw cafe wall
//2022/06/06
//1-4-45 Taiyu Honma

void setup()
{
  size(600,500);
  drawShapes();
}

void drawShapes(){
  for(int j=0;j<12;j++){
      int offset = (((j+1)%2) - 1) * 25;
      noStroke();
      for(int i = 0;i<6;i++){
        fill(0);
        rect(j*50,i*100+offset,50,50);
        fill(255);
        rect(j*50,i*100+50+offset,50,50);
      }
      stroke(150);
      strokeWeight(4);
      line((j+1)*50,0,(j+1)*50,500);
  }

}
