class SquareClass extends ObjectBase{
  float w = 30;
  int offset  = (int)random(256);
  SquareClass() {
    super(color(0,0,255));
    d = w/2;
  }
  void display(){
    if(!active) return;
    fill(color(c,float(frameCount + offset) % 256.0));
    noStroke();
    rect(x-w/2,y-w/2,w,w);
  }
  void isClicked(){
    if(active && x- d < mouseX   && mouseX < x + d && mouseY > y -d  && mouseY < y + d){
      this.active = false;
    }
  }
}
