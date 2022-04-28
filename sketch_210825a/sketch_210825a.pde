void setup()
{
  size(1980,1080);
  background(0,255,0);
  fill(255,0,0);
    noStroke();
}
float x = 0.0;
float SIZE = 0;
int para = 1;
void draw(){
  translate(990,540);
  SIZE=SIZE+para();
  DRAW();
  saveFrame("frames/######.png");
}
float para(){
  para++;
  return  pow(1.2,para)/100;
}
void DRAW(){
  for(int j = 0;j <= 120;j++){
    x = PIE*j*0.02;
    float nx = PIE*(j+1)*0.02;
  quad(0,0,0,0,COS(x),SIN(x),COS(nx),SIN(nx));
  fill(random(0,255),random(0,255),random(0,255));
  println(x);
  }
}
float SIN(float x){
   return map(sin(x),-1,1,-540*SIZE,540*SIZE);
}
float COS(float x){
   return map(cos(x),-1,1,-590*SIZE,590*SIZE);
}
