class Icon {
  int x;
  float y;
  float sy;
  float t=0;
  float a;
  float v0;
  boolean jumping = false;
  boolean finish = false;
  float intervalTimer = interval;
  color c = color(0,0,0);
  
  float launching_time = 0;
  Icon(int _x, int _y, float _a, float _v0, color _c) {
    x = _x;
    sy = _y;
    a = _a;
    v0 = _v0;
    c = _c;
  }
  void on() {
    if (dist(mouseX, mouseY, x, height - sy) < 95/2) {
      jumping = true;
      finish = false;
      launching_time = 0;
    }
  }
  void draw() {
    drawRoundedRect(x, height - (sy + y), 52, 52, 15,c);
    if(launching_time > T) {
      finish = true;
    }
    intervalTimer += 1.0/frameRate;
    if (jumping && intervalTimer > interval) {
      y = v0 * t - 0.5*a*(t*t);
      t += 1.0/frameRate;
      launching_time += 1.0/frameRate;
      if (y < 0) {
        t = 0;
        intervalTimer = 0;
        y = 0;
        if(finish){
          println("起動完了");
          jumping = false;
        }
      }
    }
    //println(t);
  }
}
void drawRoundedRect(float x, float y, float w, float h, float r, color c) {
  fill(c);
  pushMatrix();
  translate(-w/2, -h/2);
  beginShape();
  vertex(x+r, y);
  vertex(x+w-r, y);
  quadraticVertex(x+w, y, x+w, y+r);
  vertex(x+w, y+h-r);
  quadraticVertex(x+w, y+h, x+w-r, y+h);
  vertex(x+r, y+h);
  quadraticVertex(x, y+h, x, y+h-r);
  vertex(x, y+r);
  quadraticVertex(x, y, x+r, y);
  endShape(CLOSE);
  popMatrix();
}
