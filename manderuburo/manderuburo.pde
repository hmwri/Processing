class complex {
  float a;
  float b;

  complex(float _a,float _b){
    a = _a;
    b = _b;
  }
  float abs(){
    return a*a+b*b;
  }
  complex pow(){
    return new complex(a*a-b*b,2*a*b);
  }
  complex plus(complex z){
    return new complex(a+z.a,b+z.b);
  }
}
  int w = 1000;
  int h = 1000;
  int offset_x = -w/2;
  int offset_y = -h/2;
  float zoom = 1.0;
void setup()
{
  size(1000,1000);
  background(0);
  drawShape();
  frameRate(60);
}
void draw(){
  n++;
  drawShape();
  saveFrame("frames/######.png");
}

void keyPressed() {
  float diff = 10;
  switch (keyCode) {
    case RIGHT:
        offset_x-=diff;
        break;
    case LEFT:
      offset_x+=diff;
      break;
    case UP:
      offset_y+=diff;
      break;
    case DOWN:
      offset_y-=diff;
      break;
    case SHIFT:
      zoom+=1.0;
  }
  background(0);
  drawShape();
}
float n = 1;
void drawShape(){
    for(float y=0;y<h;y++){
      for(float x=0;x<w;x++){
        c = new complex((x+offset_x)/((w/4)*zoom),(y+offset_y)/((h/4)*zoom));
        float r = f(new complex(0,0),n);
        if(r==0){
          stroke(255,255,255);
        }else {
          stroke(0,0,((n*n-r*r)%256));
        }
       
         point(x,y);
      }
  }
}
complex c = new complex(-1,0);
float f(complex z,float n){
  complex result = z.pow().plus(c);
  if(result.abs()>4){
    return n;
  };
  if(n==0){
    return 0;
  }
  return f(result,n-1);
}
