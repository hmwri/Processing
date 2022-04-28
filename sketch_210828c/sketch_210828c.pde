void setup()
{
  size(4000,10);
  background(255,255,255);
  fill(255,0,0);
    //noStroke();
}
int n= 1;
int k=0;
float t = 2;
void draw(){
  DRAW();
  n++;

  saveFrame("frames/######.png");
}
void DRAW(){
    for(int i=0;i <= 400;i++){
       fill(random(i/2,255),random(i/2,255),random(i/2,255));
       rect(i*10, 0,10, 10); 
       println(i);
    }
  
}
