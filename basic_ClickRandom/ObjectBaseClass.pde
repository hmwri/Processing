abstract class ObjectBase {
  float x;
  float y;
  float vx;
  float vy;
  float d;
  color c;
 ObjectBase(int sx, int sy){
   x = sx;
   y = sy;
   vx = random(-5,5);
   vy = random(-5,5);
  }
  void move(){
    noStroke();
    fill(c);
    x += vx;
    y -= vy;

  }
  abstract void display();
}
