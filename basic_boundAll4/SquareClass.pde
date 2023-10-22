class SquareClass extends ObjectBase{
  float w = 30;
  SquareClass() {
    super(color(0,0,255));
    d = w/2;
  }
  void display(){
    noStroke();
    fill(c);
    rect(x-w/2,y-w/2,w,w);
  }
}
