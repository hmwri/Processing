class SquareClass extends Bound{
  float w = 30;
  SquareClass() {
    super();
    d = w/2;
    c = color(0,0,255);
  }
  void draw(){
    noStroke();
    fill(c);
    super.draw();
    rect(x-w/2,y-w/2,w,w);
  }
}
