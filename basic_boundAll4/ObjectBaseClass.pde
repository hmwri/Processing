abstract class ObjectBase {
  float x;
  float y;
  float vx;
  float vy;
  float d;
  color c;
 ObjectBase(){
   commonInit();
  }
  ObjectBase(color _c){
    commonInit();
    c = _c;
  }
  void commonInit(){
        x = random(width);
    y = random(height);
    vx = random(-5,5);
    vy = random(-5,5);
  }
  void move(){
    noStroke();
    fill(c);
    x += vx;
    y -= vy;
        x = min(width-d,x);
    y = min(height-d,y);
    x = max(x,d);
    y = max(y,d);
    if(x == width-d || x == d){
      vx = -vx;
    }
    if(y == height-d || y == d){
      vy = -vy;
    }
  }
  abstract void display();
}
