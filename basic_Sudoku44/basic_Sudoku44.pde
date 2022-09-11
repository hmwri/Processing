//basic_Sudoku44
//play sudoku
//2022/06/20
//1-4-45 Taiyu Honma

int[][] masu = new int[4][4];
void setup()
{
  masu[0][3] = 3;
  masu[2][0] = 2;
  masu[3][2] = 4;
  masu[3][1] = 1;
  size(640,640);
}
void mousePressed(){
  for(int i=0;i<4;i++){
    for(int j=0;j<4;j++){
      if (aida(mouseX,160*j,160*(j+1)) && aida(mouseY,160*i,160*(i+1))  ){
        masu[i][j]++ ;
      }
    }
  }
}


boolean aida(int n ,int min, int max){
  return min < n && n < max;
}
void draw(){
  

  strokeWeight(1);
  for(int i=0;i<4;i++){
    for(int j=0;j<4;j++){
      fill(255);
      rect(j*160,i*160,160,160);
      fill(0);
      textSize(50);
      textAlign(CENTER);
      if(masu[i][j]%5 != 0){
        text(masu[i][j]%5,j*160+80,i*160+90);
      }
      
    }
  }
  strokeWeight(2);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
}
