class CircleClass extends ObjectBase{
  float r = 15;
  CircleClass() {
    super();
    d = r;
    c = color(255,0,0);
  }
  void display(){
    noStroke();
    fill(255,0,0);
    fill(c);
    ellipse(x,y,r*2,r*2);
  }
}
