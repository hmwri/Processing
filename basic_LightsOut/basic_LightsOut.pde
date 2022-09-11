//basic_LightsOut
//play lightsout
//2022/06/20
//1-4-45 Taiyu Honma

boolean[][] masu = new boolean[5][5];
void setup()
{
  masu[1][3] = true;
  masu[2][3] = true;
  masu[2][4] = true;
  masu[3][2] = true;
  masu[3][1] = true;
  masu[4][2] = true;
  size(800,800);
}
void mousePressed(){
  for(int i=0;i<5;i++){
    for(int j=0;j<5;j++){
      if (aida(mouseX,160*j,160*(j+1)) && aida(mouseY,160*i,160*(i+1))  ){
        hanten(i,j);
        hanten(i+1,j);
        hanten(i-1,j);
        hanten(i,j+1);
        hanten(i,j-1);
      }
    }
  }
}

void hanten(int i, int j) {
  if( i < 5 && i >= 0 && j < 5 && j >= 0) 
   masu[i][j] = !masu[i][j];
}

boolean aida(int n ,int min, int max){
  return min < n && n < max;
}

void draw(){
  boolean flag = true;
  for(int i=0;i<5;i++){
    for(int j=0;j<5;j++){
      fill(0);
      if(masu[i][j]){
        fill(255,255,0);
        flag = false;
      }
      rect(j*160,i*160,160,160);
    }
  }
  if(flag){
    fill(255);
    textSize(100);
    textAlign(CENTER);
    text("CLEAR!" , 400,400);
  }
}
