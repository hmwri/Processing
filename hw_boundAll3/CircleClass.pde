class CircleClass extends Bound{
  float r = 15;
  CircleClass() {
    super();
    d = r;
    c = color(255,0,0);
  }
  void draw(){
    noStroke();
    fill(255,0,0);
    super.draw();
    fill(c);
    ellipse(x,y,r*2,r*2);
  }
}
