void setup()
{
  size(900,300);
}
int[][] data = new int[10][30];
boolean move = false;
void draw(){
    for(int i=0;i<10;i++){
      int first = data[i][29];
    for(int j=29;j>=0;j--){
      if(move){
          if(j == 0){
            data[i][0] = first;
          }else{
             data[i][j] = data[i][j - 1];
          }
         

      }
      fill(getColor(data[i][j]));
      ellipse(j*30+15,i*30+15,30,30);
    }
  }
}

color getColor(int n){
  switch(n%4) {
    case 0:
      return color(255);
    case 1:
      return color(255,0,0);
    case 2:
      return color(255,255,0);
    default:
      return color(0,255,0);
  }
}
void mousePressed(){
  for(int i=0;i<10;i++){
    for(int j=0;j<30;j++){
      if (dist(j*30+15,i*30+15,mouseX,mouseY) < 15  ){
        data[i][j] ++;
      }
    }
  }
}
void keyPressed(){
  if(keyCode == RIGHT){
    move=true;
    
  }
}
boolean aida(int n ,int min, int max){
  return min < n && n < max;
}
