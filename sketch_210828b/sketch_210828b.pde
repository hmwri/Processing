void setup()
{
  size(2000,2000);
  background(255,255,255);
  fill(255,0,0);
    //noStroke();
}
int n= 1;
int k=0;
float t = 2;
void draw(){
  k = 255 - n*3 - 10;
  if (t < 10000){
  t = pow(1.2,n);
  }
  if(k<0){
    k=0;
  }
  DRAW(floor(t/100));
  n++;

  saveFrame("frames/######.png");
}
void DRAW(float x){
  for(int j = 0;j <= x;j++){
    for(int i=0;i <= x;i++){
       fill(random(k,255),random(k,255),random(k,255));
       rect(j*2000/x, i*2000/x,2000/x, 2000/x); 
       println(i);
    }
  }
}
