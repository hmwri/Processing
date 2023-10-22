//hw_dashLine
//make draw dashline function
//2022/09/26
//1-4-45 Taiyu Honma


void setup() {
  background(0);
  size(800,800);
  stroke(255);
  //検証用(フラクタル)
  //writeLine(width/2,height/2,1,1);
  //strokeWeight(2);
  //writeLine(width/2,height/2,1,-1);
}

void writeLine(int sx,int sy,int d,float direction){
  if(d == 7) return;
  stroke(color(random(100,255),random(100,255),random(100,255)));
  int nx1 = int(sx+150*1.0/d*direction);
  int ny1 = int(sy+150*1.0/d*direction);
  int nx2 = int(sx-150*1.0/d*direction);
  int ny2 = int(sy+150*1.0/d*direction);
  dashline(sx,sy,nx1,ny1);
  dashline(sx,sy,nx2,ny2);
  writeLine(nx1,ny1,d+1,direction);
  writeLine(nx2,ny2,d+1,direction);
}
void dashline(int x1,int y1,int x2,int y2){
  float m = atan2(y2-y1,x2-x1);
  float nx = x1;
  float ny = y1;
  int i=0;
  float theta = m;
  float length = dist(x1,y1,x2,y2);
  while(dist(x1,y1,nx,ny) < length){
    float dx = 5*cos(theta);
    float dy = 5*sin(theta);
    float x = dx + nx;
    float y = dy + ny;
    println("x:",x,"y:",y);
    if(i%2==0){
      line(nx,ny,x,y);
    }
    i++;
    nx = x;
    ny = y;
  }
  
  
}
void draw(){
  background(255);
  colorMode(HSB,256,256,256);
  stroke(frameCount%255,255,200);
  strokeWeight(2);
   dashline(mouseX,mouseY,width/2,height/2);
   strokeWeight(1);
   dashline(mouseY,mouseX,width/2,height/2);
}
