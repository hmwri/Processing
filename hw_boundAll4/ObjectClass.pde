class Object {
  float x;
  float y;
  float vx;
  float vy;
  float d;
  color c;
  Object(){
    x = random(width);
    y = random(height);
    vx = random(-5,5);
    vy = random(-5,5);
  }
  void draw(){
    x += vx;
    y -= vy;
  }
}
