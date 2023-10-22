class TriangleClass extends LoopMove {
  TriangleClass() {
    super();
  }
  void draw(){
    fill(0,0,0);
    noStroke();
    super.draw();
    triangle(x,y-20,x-20,y+20,x+20,y+20);
  }
}
