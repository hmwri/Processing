void setup() {
  size(1200,900);
}

class rectangle {
  color c;
  int sx,sy,ex,ey;
  int w,h;
  rectangle(int _sx,int  _sy,int _ex, int _ey) {
    sx = _sx;
    sy = _sy;
    ex = _ex;
    ey = _ey;
    c = color(random(255),random(255),random(255));
    w = abs(sx-ex);
    h = abs(sy-ey);
  }
  void draw() {
    fill(c);
    rectMode(CORNERS);
    rect(sx,sy,ex,ey);
  }
}



class physicsRectangle extends  rectangle {
  physicsRectangle(int _sx,int  _sy,int _ex, int _ey) {
    super(_sx,_sy,_ex,_ey);
  };
}

rectangle drawingRect;

void draw() {
  background(255);
  if(mousePressed) {
     drawingRect.draw();
  };
}

void mouseDragged() {
  drawingRect.ex = mouseX;
  drawingRect.ey = mouseY;
}

void mousePressed(){
  drawingRect = new rectangle(mouseX,mouseY,mouseX,mouseY);
}
