//basic_LightsOutSave
//save lightsout
//2022/11/14
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
  String[] lines = loadStrings("status.txt");
  for(int y=0;y<5 && lines != null;y++){
    String[] data = split(lines[y],",");
    int x = 0;
    for(String d :data){
      masu[x][y] = boolean(d);
      x++;
    }
  }
  
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
  String[] saveLines = new String[5];
  for(int y=0; y<5; y++){
    saveLines[y] = "";
    for(int x=0; x<5; x++){
      saveLines[y] += (str(masu[x][y]) + (x == 4 ? "" : ","));
    }
  }
  saveStrings("status.txt", saveLines);
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
