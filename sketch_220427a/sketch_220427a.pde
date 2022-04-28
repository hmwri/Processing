class p {
  float x;
  float y;
  p(float _x,float _y){
    x = _x;
    y = _y;
  }
  void draw(){
    point(x,y);
  }
  boolean isMouseOn() {
    if ((abs(x - mouseX) < 60) && (abs(y - mouseY) < 60)) {
      return true;
    };
    return false;
  }
}
class mp {
  p p1;
  p p2;
  mp (p _p1,p _p2){
    p1 = _p1;
    p2 = _p2;
  }
  void draw() {
    point((p1.x+p2.x)/2,(p1.y+p2.y)/2);
  }
}
p p1;
p p2;
mp mp1;
void setup(){
  size(900,900);
  p1 = new p(1,2);
  p2 = new p(1,3);
  mp1 = new mp(p1,p2);
  p1.draw();
  p2.draw();
}

void draw(){
   background(255);
   strokeWeight(10);
   stroke(0,0,0);
   line(p1.x,p1.y,p2.x,p2.y);
   
   stroke(255,0,0);
   p1.draw();
   if (p1.isMouseOn() && mousePressed) {
     p1.x = mouseX;
     p1.y = mouseY;
   }else if(p2.isMouseOn() && mousePressed){
          p2.x = mouseX;
     p2.y = mouseY;
   }
   p2.draw();
   mp1.draw();
}
