float e =  1.0;
float g = 0;
  int w = 1680;
  int h = 1000;
class Vector {
  float x;
  float y;
  float arg;
  Vector(float _x,float _y){
    this.x = _x;
    this.y = _y;
  }
}
class object {
  int time = 0;
  float x;
  float y;
  int r;
  float sy;
  Vector v;
  object(float x,float y,int r,Vector v){
    this.x=x;
    this.sy=y;
    this.y=y;
    this.r=r;
    this.v = v;
  }
  void draw(){
    fill(0);
    circle(x,round(y),r*2);
  }
  void fall(){
    v.y = v.y+g*1/3.6;
    y = y+v.y*1/3.6;
    x = x+v.x*1/3.6;
    if (y - r < 0){
      y = r;
      v.y = -e *v.y;
    }
    if (y + r > h){
      y = h - r;
      v.y = -e *v.y;
    }
    if (x+r>w){
      x = w -r;
      v.x = -e * v.x;
    }
    if (x-r<0){
      x = r;
      v.x = -e * v.x;
    }
  }
}
float load (float x) {
  return (x-800.0)*(x-800.0)/-200+600.0;
}
class trajectory extends object{
  int createdTime;
  trajectory(object o){
    super(o.x,o.y,o.r,o.v);
    this.createdTime = frameCount;
  }
  void draw(){
    if (frameCount - createdTime < 300){
     stroke((frameCount - createdTime)*0.8);
    noFill();
    circle(x,round(y),r*2);
    }
  }
}
ArrayList<object> objects = new ArrayList<object>();
ArrayList<trajectory> trajects = new ArrayList<trajectory>();
void setup() {
  background(255);
  size(1680,1000);
  for (int i=0;i<10;i++){
    objects.add(new object(int(random(0,0)),int(random(10,h)),10,new Vector(random(-10,10),random(-10,10))));
  }
}

void draw(){
  background(255);
  for (int i=0;i<w;i++){
    point(i,int(load(i)));
  }
  for (int i=0;i < objects.size();i++){
    object target = (object)objects.get(i);
    target.fall();
    target.draw();
    if (frameCount%5==0){
      trajects.add(new trajectory(target));
      
    }
  }
  for (int i=0;i < trajects.size();i++){
    trajectory target = (trajectory)trajects.get(i);
    target.draw();
  }
  
}
