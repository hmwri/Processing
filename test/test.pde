void setup(){
  size(1800,1080);
}
ArrayList<maru> marus = new ArrayList<maru>();
int i=0;
void draw(){

  noStroke();
  background(0);
  fill(100);
  text("test",20,20);
  colorMode(HSB,100);
  
  for(maru m : marus){
    m.draw();
  }
  i+=1;
  marus.add(new maru(mouseX,mouseY,(int)random(2) ==  1 ? -(int)random(2,5) :(int)random(2,5) ,(int)random(2) ==  1 ? -(int)random(2,5) :(int)random(2,5) ,color(i%100,255,255)));
  
}


class maru {
  color c;
  int x;
  int y;
  int vx;
  int vy;
  int r = (int)random(5,40);
  int[] kx = new int[10];
  int[] ky = new int[10];
  maru(int _x,int _y,int _vx,int _vy,color _c) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    c = _c;
  }
  void draw(){
    if(x > 1&& y>1 && x < width&&y<height){
    
    fill(c); 
    for(int i=9;i>0;i--){
      kx[i] = kx[i-1];
    }
    for(int i=9;i>0;i--){
      ky[i] = ky[i-1];
    }
    kx[0] = x;
    ky[0] = y;
    for(int i=0;i<10;i++){
      fill(c,80-8*i);
      ellipse(kx[i],ky[i],r,r);
    }
    ellipse(x,y,r,r);
    x+=vx;
    y+=vy;
    }
  }
}
