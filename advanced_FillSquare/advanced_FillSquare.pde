//advanced_FillSquare
//draw filling sauare
//2022/06/06
//1-4-45 Taiyu Honma

void setup()
{
  size(900,900);
  
}

void draw()
{
  background(100);
  rect(0,0,mouseX,mouseY);
  int a = max(mouseX,mouseY);
  int b = min(mouseX,mouseY);
  if(mouseX != 0 && mouseY !=0){
      f(a,b,0,0,mouseX < mouseY ? 1 : 0);
  }
}
int f(int a, int b,int x,int y,int j){
  int n = floor(a/b);
  for(int i=0; i< n; i++){
    if(j %2 == 0){
      rect(x+b*i,y,b,b);
    }else{
      rect(x,y+b*i,b,b);
    }
  }
  return a % b == 0 ?  0 : f(b,a % b,j%2==0? x+b*n : x ,j%2!=0? y+b*n: y,j+1) ;
}
