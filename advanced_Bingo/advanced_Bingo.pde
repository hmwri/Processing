//advanced_Bingo
//play bingo
//2022/06/20
//1-4-45 Taiyu Honma

int[][] masume = new int[5][5];
boolean[][] select = new boolean[5][5];
int[] already = new int[25];
//　黒1,白2
void setup()
{
  masume[3][3] = 2;
  masume[4][4] = 2;
  masume[4][3] = 1;
  masume[3][4] = 1;
  size(500,500);
  for(int i=0;i<5;i++){
    
    for(int j=0;j<5;j++){
      int r = (int)random(1,26);
      if(i*5+j != 0){
        while(Already(r,i*5+j)) {
          r = (int)random(1,26);
        }
      }
      already[i*5+j] = r;
      masume[j][i] = r;
    }
  }
  already = new int[25];
}

boolean Already(int r,int i){
  for(int j=0;j<=i;j++){
    if(already[j] == r){
      return true;
    };
  }
  return false;
}

void draw(){
  for(int y=0; y < 5;y++){
    for(int x=0; x< 5; x++){
      fill(255);
      if(select[y][x]){
        fill(100);
      }
      rect(x * 100,y*100,100,100);
      fill(0);
      textSize(50);
      textAlign(CENTER);
      text(masume[y][x],x*100+50,y*100+70);
    }
  }
}
int pressed = 0;
void mousePressed(){
  if(pressed > 24){
    return;
  }
  int r = (int)random(1,26);
  while(Already(r,24)){
    r = (int)random(1,26);
  }
  already[pressed] = r;
  pressed++;
  println(r+"が選ばれました");
  for(int y=0; y < 5;y++){
    for(int x=0; x< 5; x++){
      if(masume[y][x] == r){
        select[y][x] = true;
        return;
      }
    }
  }
  
}
boolean aida(int n ,int min, int max){
  return min < n && n < max;
}
