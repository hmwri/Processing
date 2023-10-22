class chara {
  boolean[][] body = new boolean[][]{};
  boolean showd = false;
  String name = "unnamed";
  int w = 100;
  int h = 100;
  int x = 0;
  int y = 0;

  chara(boolean[][] _body, int _x, int _y) {
    body = _body;
    x = _x;
    y = _y;
  }
  void setName(String _name) {
    if(!showd){
       name = _name;
    }
  }
  void draw() {
    drawBody(body, x, y, w, h);
  }
  void draw(int x, int y, int w, int h, int r) {
    drawBody(body, x, y, w, h, r);
  }
}

boolean[][] randomBody(int w, int h) {
  boolean[][] body = new boolean[h][w];
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      body[y][x] = random(1) > 0.5 ? true : false;
    }
  }
  return body;
}

void drawBody(boolean[][] _body, int sx, int sy, int w, int h) {
  for (int y = 0; y < _body.length; y++) {
    for (int x = 0; x < _body[y].length; x++) {
      if (_body[y][x]) {
        fill(0);
      } else {
        fill(255);
      }
      rect(sx+x*w, sy+y*h, w, h);
    }
  }
}
void drawBody(boolean[][] _body, int sx, int sy, int w, int h, int r) {
  pushMatrix();
  translate(sx, sy);
  switch (r) {
  case 0:
    rotate(0);
    break;
  case 1:
    rotate(PI/2);
    translate(-w* CHARA_BOX_SIZE, 0);
    break;
  case 2:
    rotate(PI);
    translate(-w* CHARA_BOX_SIZE, -h*CHARA_BOX_SIZE);
    break;
  case 3:
    rotate(PI/2*3);
    translate(0, -h*CHARA_BOX_SIZE);
    break;
  }
  
  for (int y = 0; y < _body.length; y++) {
    for (int x = 0; x < _body[y].length; x++) {
      if (_body[y][x]) {
        fill(0);
      } else {
        fill(255);
      }
      rect(x*w, y*h, w, h);
    }
  }
  popMatrix();
}
