class CrossClass extends LoopMove {
  int length = 20;
  CrossClass() {
    super();
  }
  void draw(){
    strokeWeight(3);
    stroke(0,255,0);
    super.draw();
    line(x + length,y+length,x-length,y-length);
    line(x + length,y-length,x - length,y +length);
  }
}
