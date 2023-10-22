class CircleClass {
  float x;
  float y;
  float vx;
  float vy;
  float d;
  color c;
  float r;
  boolean isShow = true;
  CircleClass() {
        x = random(width);
    y = random(height);
    vx = random(-5,5);
    vy = random(-5,5);
    r = random(10,30);
    d = r;
    c = color(255,0,0);
  }
  void draw(){
    if(!isShow){
      return;
    }
    noStroke();
    fill(255,0,0);
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
    x += vx;
    y += vy;
    fill(c);
    ellipse(x,y,r*2,r*2);
  }
  boolean inspectClick() {
    println(dist(mouseX,mouseY,x,y) );
    if(dist(mouseX,mouseY,x,y) < r){
      println("here");
      if(isShow == true) {
        isShow = false;
        return true;
      }
      
      
    }
    return false;
    
  }
}
