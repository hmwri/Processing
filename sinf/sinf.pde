void setup()
{
  size(1000,400);
}

void draw(){
  background(255);
  pushMatrix();
  translate(width/2 ,height/2);
  for(int i = -width/2;i<width/2;i++){
    float y1 = f(float(i)/(width/2)*10, float(frameCount));
    float y2 = f(float(i+1)/(width/2)*10, float(frameCount));
    line(i,y1*(height/2),i+1,y2*(height/2));
  }
  popMatrix();
}
float f(float x, float t){
  return sin(x+t*PI/180);
}
