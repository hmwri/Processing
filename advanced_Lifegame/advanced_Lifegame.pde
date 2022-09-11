//advanced_Lifegame
//play lifegame
//2022/06/20
//1-4-45 Taiyu Honma

boolean[][] masume = new boolean[102][102]; //現在の情報;

//　黒1,白2
void setup()
{
 
  frameRate(10);
  size(800,800);
  
  for(int i=1;i<101;i++){
    for(int j=1;j<101;j++){
      masume[i][j] = (int)random(2) == 1 ?  true :false;
    }
  }
}


void draw(){
  background(0);
  boolean[][] data = new boolean[102][102]; //次世代の情報;
  for(int y=1; y < 101;y++){
    for(int x=1; x< 101; x++){
      fill(0);
      if(masume[y][x]) fill(0,255,0);
      rect((x-1)*8,(y-1)*8,8,8);
      if(masume[y][x]){
        if(inspect(x,y)<=1 || inspect(x,y)>=4) { 
          data[y][x] = false ;
        }else{ data[y][x] = true;}
      }else{
          if(inspect(x,y)==3) { data[y][x] = true; }else{ data[y][x] = false;}
        };
      
    }
  }
  arrayCopy(data,masume);
}

int inspect(int x,int y){
  int n = 0;
  for(int i = -1; i < 2; i++){
      for(int j = -1; j < 2; j++){
        if((i == 0 && j == 0)){
          continue;
        }
        if(masume[y+i][x+j] ){
          n++;
        }
      }
  }
  return n;
}
