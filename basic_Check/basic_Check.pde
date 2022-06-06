//basic_Check
//draw check
//2022/06/06
//1-4-45 Taiyu Honma

void setup()
{
  size(800,800);
  background(41,37,34);
  for(int y = 0;y < 800;y++){
    for(int x = 0;x < 800; x++)
    {
      if(sin(float(x+y)/30.0)*cos(float(x-y)/30.0)<=0){
        stroke(79,175,135);
        point(x,y);
      }
    }
  }
}

void draw()
{
}
