float e =  1;
float g = 0;
int w = 1680;
int h = 1000;
Boolean track = true;
float katamuki = 700;
class rgb {
  int R;
  int G;
  int B;
  int A;
  rgb(int _R,int _G,int _B,int _A){
    this.R = _R;
    this.G = _G;
    this.B = _B;
    this.A = _A;
  }
}

class form {
  int x,y;
  form(int _x,int _y){
    this.x = _x;
    this.y = _y;
  }
  void draw() {
  }
}
class Vector {
  float x;
  float y;
  float arg;
  Vector(float _x,float _y){
    this.x = _x;
    this.y = _y;
  }
  float abs() {
    return sqrt(x*x+y*y);
  }
  void multi(float t){
    this.x *= t;
    this.y *= t;
  }
  void div(float t){
    this.x /= t;
    this.y /= t;
  }
  Vector tani() {
    return new Vector(this.x/this.abs(),this.y/this.abs());
  }
  float katamuki(){
    return this.y/this.x; 
  }
}
float v0x = 0;
float v0y = 25;
float naiseki(Vector v1, Vector v2){
  return v1.x*v2.x + v1.y*v2.y;
}
class object {
  int time = 0;
  float x;
  float y;
  int r;
  float sy;
  rgb c;
  Vector v;
  object(float x,float y,int r,Vector v,rgb _ObjColor){
    this.x=x;
    this.sy=y;
    this.y=y;
    this.r=r;
    this.v = v;
    this.c = _ObjColor;
  }
  void draw(){
    fill(c.R,c.G,c.B,c.A);
    circle(x,round(y),r*2);
  }
  void fall(){
    v.y = v.y-g*1/3.6;
    y = y+v.y*1/3.6;
    x = x+v.x*1/3.6;
    float load_y = load(x);
    Vector load_Vec = new Vector(1,(2/katamuki)*x);

    if (y - r > h){
      y = h-r;
      v.y = -e *v.y;
    }
    if (y + r < 0){
      y = r;
      v.y = -e *v.y;
    }
    if (x-r>w/2){
      x = w/2+r;
      v.x = -e * v.x;
    }
    if (x+r<-w/2){
      x = -w/2-r;
      v.x = -e * v.x;
    }
    if (y - r < load_y){
      y = load_y + r;
      float vec_cos = naiseki(load_Vec,v)/(load_Vec.abs()*v.abs());
      float vec_sin = sqrt(1 - sq(vec_cos));
      Vector v_90 = new Vector(1,-(load_Vec.x/load_Vec.y)).tani();
      if(load_Vec.katamuki() < 0){
         v_90 = new Vector(-1,(load_Vec.x/load_Vec.y)).tani();
      }
      v_90.multi(vec_sin*v.abs()*-e);
      Vector v_0 = load_Vec.tani();;
      v_0.multi(vec_cos*v.abs());
      v.x = v_90.x+v_0.x;
      v.y = v_90.y+v_0.y;
    }
  }
}
float load (float x) {
  return x*x/katamuki;
}
int random256() {
  return int(random(20,256));
}
class trajectory extends object{
  int createdTime;
  trajectory(object o){
    super(o.x,o.y,o.r,o.v,o.c);
    this.createdTime = frameCount;
  }
  void draw(){
    if (frameCount - createdTime < 128){
     stroke(c.R,c.G,c.B,128-(frameCount - createdTime)*1);
     fill(c.R,c.G,c.B,128-(frameCount - createdTime)*1);
    circle(x,round(y),r*2);
    }
  }
}
ArrayList<object> objects = new ArrayList<object>();
ArrayList<trajectory> trajects = new ArrayList<trajectory>();

int knobValue;
void setup() {

  background(255);
  size(1680,1000);
  for (int i=0;i<100;i++){
    objects.add(new object(int(random(-w/2+2,w/2-2)),h-4,3,new Vector(v0x,v0y),new rgb(random256(),random256(),random256(),256)));
  }
}
void keyPressed() {
  if (key == CODED) {      // ????????????????????????????????????????????????
    if (keyCode == UP) {    // ????????????????????????
      katamuki=katamuki-100;
    } else if (keyCode == DOWN) {
      katamuki=katamuki+100;
    } else if (keyCode == RIGHT) {
      g=g+1;
    } else if (keyCode == LEFT) {
      g=g-1;
    } 
  }
    if (key == TAB) {          // Tab???????????????
    track=!track;
  }  
}
void mouseWheel(MouseEvent e1 ){
  if( e1.getCount() < 0 ){
    e+=0.1;
  } else {
    e-=0.1;
  }
}
void draw(){
  translate(w/2,h);
  scale(1,-1);
  background(knobValue);
  stroke(255);
  for (int i=-w/2;i<w/2;i++){
    line(i,int(load(i)),i+1,int(load(i+1)));
  }
  noStroke();
  for (int i=0;i < objects.size();i++){
    object target = (object)objects.get(i);
    target.fall();
    target.draw();
    if (frameCount%3==0&&track){
      trajects.add(new trajectory(target));
    }
  }
  for (int i=0;i < trajects.size();i++){
    trajectory target = (trajectory)trajects.get(i);
    target.draw();
  }
  fill(255);
  textSize(30);
  scale(1,-1);
  text("e="+e+"(scroll)",-w/2+100,-200);
  text("g="+g+"(right/left key)",-w/2+100,-150);
  text("m="+1/katamuki+"(up/down key)",-w/2+100,-100);
  text("track="+track+"(tab key)",-w/2+100,-50);
}
