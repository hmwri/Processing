class Canvas extends UIObject {
  int[] colors =  new int[3];
  int weight = 1;
  color background;

  Canvas(int _x, int _y, int _w, int _h, color _bg) {
    super(_x, _y, _w, _h);
    background = _bg;
    clear();
  }
  void display() {
   if(mousePressed && onMouse(mouseX,mouseY)) {
     noStroke();
     
     fill(color(colors[0],colors[1],colors[2]));
     ellipse(mouseX,mouseY,weight*10,weight*10);
   }
  }
  void clear() {
    fill(background);
    rect(x, y, w, h);
  }
}
