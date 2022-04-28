int mode = 0;
int center;
ArrayList<Obj> objects = new ArrayList<Obj>();
button[] buttons = new button[2];
rectangle editing = new rectangle(0,0,0,0);

void setup(){
  makebuttons();
  size(1980,1080);
  center = width/2;
  background(255);
}
interface Obj {
  void draw();
}
class shape {
  int sx,sy,ex,ey;
  shape(int _sx,int _sy,int _ex,int _ey){
    this.sx=_sx;
    this.sy=_sy;
    this.ex=_ex;
    this.ey=_ey;
  }
}
class rectangle extends shape implements Obj{
  rectangle(int _sx,int _sy,int _ex,int _ey){
    super(_sx,_sy,_ex,_ey);
  }
  void draw(){
    rect(sx,sy,ex-sx,ey-sy);
  }
}

class button extends shape{
  int id;
  button(int _sx,int _sy,int _ex,int _ey,int _id){
    super(_sx,_sy,_ex,_ey);
    this.id = _id;
  }
  void draw(){
    rect(sx,sy,ex-sx,ey-sy);
  }
  boolean pushed() {
    if (mouseX > sx && mouseY > sy && mouseX < ex && mouseY < ey && mousePressed){
      return true;
    }
    return false;
  }
}

void draw(){
  background(255);
  toulber();
  for (int i=0;i < objects.size();i++){
    Obj target = (Obj)objects.get(i);
    target.draw();
  }

  if (mousePressed){

    editing.ex = mouseX;
    editing.ey = mouseY;
    shapeToObj(editing).draw();
  }

}

void mousePressed() {
  editing.sx = mouseX;
  editing.sy = mouseY;
}

void mouseReleased(){
  objects.add(shapeToObj(editing));
}

void toulber() {
  fill(0);
  rect(0,height,width,100);
  for (button target:buttons ){
    target.draw();
      if (target.pushed()) {
        mode = target.id;
        print(mode);
      }
   }
}
void makebuttons() {
  int padding = 5;
  int w = 100;
  int h = 50;
  int ex = 0;
  for (int i=0;i<buttons.length;i++){
    buttons[i] = new button(ex+padding*i,height-h+padding,ex+padding*i+w,height,i);
    ex = ex+padding*i+w;
  }
}
Obj shapeToObj(shape s) {
  if(mode==0){
    return new rectangle(s.sx,s.sy,s.ex,s.ey);
  }
  return new rectangle(s.sx,s.sy,s.ex,s.ey);
}
