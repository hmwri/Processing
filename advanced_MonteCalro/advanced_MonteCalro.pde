//advanced_MonteCalro
//calc pie with MonteCalro
//2022/05/16
//1-4-45 Taiyu Honma

void setup()
{
  size(800,800);
}
int uti = 0;
void draw(){
  frameRate(3000);
  float x = random(0,800);
  float y = random(0,800);
  if(dist(400,400,x,y) < 400){
    stroke(255,0,0);
    fill(255,0,0);
    ellipse(x,y,3,3);
    uti++;
  }else{
    fill(0,0,255);
    stroke(0,0,255);
    ellipse(x,y,3,3);
  }
  if(frameCount%100 == 0){
    println(4.0*uti/frameCount);
  }
}
