//hw_boundAll
//draw moving many ball
//2022/09/26
//1-4-45 Taiyu Honma
ArrayList<shikaku> s = new ArrayList<shikaku>();
ArrayList<maru> m = new ArrayList<maru>();
void setup() {
  size(400, 300);
  for(int i=0;i<5;i++){
    s.add(new shikaku());
  }
  for(int j=0;j<10;j++){
    m.add(new maru());
  }
}

class moving {
  float x;
  float y;
  float vx;
  float vy;
  float d;
  moving(){
    x = random(width);
    y = random(height);
    vx = random(-5,5);
    vy = random(-5,5);
  }
  void draw(){
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
}
class maru  extends moving{
  float r = 15;
  maru() {
    super();
    d = r;
  }
  void draw(){
    fill(255,0,0);
    super.draw();
    ellipse(x,y,r*2,r*2);
  }
}
class shikaku  extends moving{
  float w = 30;
  shikaku() {
    super();
    d = w/2;
  }
  void draw(){
    fill(0,0,255);
    super.draw();
    rect(x-w/2,y-w/2,w,w);
  }
}

void draw() {
  background(255);
 
  for(shikaku s: s){
    s.draw();
  }
  for(maru m: m){
    m.draw();
  }
}
