class CircleClass extends ObjectBase{
  float r = 15;
  CircleClass() {
    super();
    d = r;
    c = color(255,0,0);
  }
  void display(){
    if(!active) return;
    noStroke();
    fill(255,0,0);
    fill(c);
    r += random(-1,1);
    r = max(5,r);
    d = r;
    ellipse(x,y,r*2,r*2);
  }
  void isClicked(){
    if(active && dist(mouseX,mouseY,x,y) < d){
      this.active = false;
    }
  }
}
