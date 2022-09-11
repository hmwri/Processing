import processing.video.*;
Capture camera;

void setup()
{
  size(1280,720);
  String[] cameras = Capture.list();
  println(cameras[1]);
  camera = new Capture(this,width,height,cameras[3]);
  camera.start();
}
int[][] pixeles = new int[720][1280];
class en{
  int x;
  int y;
  int r;
  en(int _x,int _y,int _r){
    x=_x;
    y = _y;
    r= _r;
  }
  void draw(){
    ellipse(x,y,r*2,r*2);
  }
}
void draw(){
  ArrayList<en> points = new ArrayList<en>();
  if(camera.available()){
    camera.read();
  }
  background(255);
  camera.filter(0);
  image(camera,0,0);
  pixeles =  new int[720][1280];
  for(int y = 1 ; y < height ; y++) {
    for(int x = 1 ; x < width ; x++) {
      
      int p = camera.pixels[y * width + x];
      if(pixeles[y][x] == -1){
        continue;
      }
      float dx = light(camera.pixels[y * width + x-1])-light(p);
      float dy = light(camera.pixels[y * (width -1) + x])-light(p);
      if(rgb(p)&&((dy*dy+dx*dx) > 100)){
      int next = x;
      int iy = y;
      float rr = 0;
      int rx = x;
      int ry = y;
      for(int right = inspect(camera.pixels,next,iy,1),left=inspect(camera.pixels,next,iy,-1);(right != next && left != next && iy < height);right = inspect(camera.pixels,next,iy,1),left = inspect(camera.pixels,next,iy,-1),iy++){
        next = (right+left)/2;
        if(dist(right,iy,x,y)>rr){

          rr = dist(right,iy,x,y);
          rx = right;
          ry = iy;
        }
        if(dist(left,iy,x,y)>rr){
          rr = dist(left,iy,x,y);
          rx = left;
          ry = iy;
        }
      }
      if(rr > 10) {
        int nx = (x+rx)/2;
        int ny = (ry+y)/2;
        points.add(new en(nx,ny,int(rr/2)));
      }
      }

    }
  }
  ArrayList<en> sortedpoints = new ArrayList<en>();
  for(int i= 0;i < points.size();i++)
  {
    int j=0;
    en p = points.get(i);
   for(;i!= 0 &&j < sortedpoints.size() && (p.r < sortedpoints.get(j).r);j++);
      sortedpoints.add(j,p);

      
    }
   
  for(int i =0; i< min(sortedpoints.size(),4);i++){
    sortedpoints.get(i).draw();
  }
  rectMode(CORNERS);
  if(sortedpoints.size() >=4){
    quad(sortedpoints.get(0).x,sortedpoints.get(0).y,sortedpoints.get(1).x,sortedpoints.get(1).y,sortedpoints.get(2).x,sortedpoints.get(2).y,sortedpoints.get(3).x,sortedpoints.get(3).y);
  }
  
}

int inspect(int[] data,int x,int y,int direction){
  int i = x + direction;
  if(i>=width||i<0){
    return x;
  }
  if(rgb(data[i + y*width])){
    pixeles[y][x] = -1;
    return inspect(data,i,y,direction);
  }else{
    return x;
  }
  
}

float light(int p){
  float r = red(p),g = green(p),b= blue(p);
  return r+g+b;
}

boolean rgb(int p){
  int n = 50;
  float r = red(p),g = green(p),b= blue(p);
  if(r<n&&g<n&&b<n){
    return true;
  }
  return false;
}
