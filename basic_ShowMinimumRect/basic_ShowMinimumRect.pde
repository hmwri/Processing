//basic_ShowMinimumRect
//show minimum rect
//2022/07/04
//1-4-45 Taiyu Honma
void drawMinimumRect(int[] arrayX, int[] arrayY)
{
  int minX = calcMin(arrayX);
  int maxX = calcMax(arrayX);
  int minY = calcMin(arrayY);
  int maxY = calcMax(arrayY);
  

  rect(minX,minY,maxX-minX,maxY-minY);
}
int calcMin(int[] target){
  int r = target[0];
  for(int y:target){
    if(r > y){
      r = y;
    }
  }
  return r;
}
int calcMax(int[] target){
  int r = target[0];
  for(int y:target){
    if(r < y){
      r = y;
    }
  }
  return r;
}
void drawCircles(int[] arrayX, int[] arrayY)
{
  for(int i=0; i<arrayX.length; i++)
  {
    ellipse(arrayX[i], arrayY[i], 5, 5);
  }
}

void setup()
{
  size(600, 600);
  noFill();
  background(255);
  stroke(255, 0, 0);
  int[] x1 = {100, 30, 82, 54, 93};
  int[] y1 = {120, 90, 35, 88, 19};
  drawCircles(x1, y1);
  drawMinimumRect(x1, y1);

  stroke(0, 255, 0);
  int[] x2 = {350, 240, 530, 218, 339, 412, 305};
  int[] y2 = {180, 100, 350, 150, 430, 280, 320};
  drawCircles(x2, y2);
  drawMinimumRect(x2, y2);

  stroke(0, 0, 255);
  int[] x3 = {420, 350, 190, 280, 440, 325, 330};
  int[] y3 = {190, 460, 530, 250, 480, 390, 220};
  drawCircles(x3, y3);
  drawMinimumRect(x3, y3);
}
