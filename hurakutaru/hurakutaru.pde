void setup(){
  size(1000,1000);
  noFill();
 
}
void draw(){
   tri(new Point(500,0),new Point(0,1000),new Point(1000,1000),10);
}
class Point {
  float x,y;
  Point(float _x,float _y){
    x=_x;
    y=_y;
  }
}

void drawTri(Point a,Point b,Point c){
  triangle(a.x,a.y,b.x,b.y,c.x,c.y);
}

Point tyuten(Point a,Point b){
  return new Point((a.x+b.x)/2,(a.y+b.y)/2);
}
int i = 5;
void tri(Point a,Point b,Point c,int i){
  if(i==1){
    return;
  };
  drawTri(tyuten(a,b),tyuten(b,c),tyuten(c,a));
  fill(color(random(0,255),random(2,255),random(0,255)));
  tri(tyuten(a,b),tyuten(b,c),b,i-1);
  fill(color(random(0,255),random(2,255),random(0,255)));
  tri(tyuten(a,b),tyuten(a,c),a,i-1);
  fill(color(random(0,255),random(2,255),random(0,255)));
  tri(tyuten(a,c),tyuten(b,c),c,i-1);
}
