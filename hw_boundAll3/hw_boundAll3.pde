//hw_boundAll3
//write square, cross ,triangle, circle
//2022/10/03
//1-4-45 Taiyu Honma
CircleClass[] marus = new CircleClass[10];
SquareClass[] shikakus = new SquareClass[5];
CrossClass[] crosss = new CrossClass[5];
TriangleClass[] triangles = new TriangleClass[3];
void setup(){
  size(400,400);
  for(int j=0;j<shikakus.length;j++){
    shikakus[j] = new SquareClass();
  }
  for(int j=0;j<marus.length;j++){
    marus[j] = new CircleClass();
  }
  for(int j=0;j<crosss.length;j++){
    crosss[j] = new CrossClass();
  }
    for(int j=0;j<triangles.length;j++){
    triangles[j] = new TriangleClass();
  }
}
void draw(){
  background(255);
  
     for(int j=0;j<shikakus.length;j++){
    shikakus[j].draw();
  }
     for(int j=0;j<marus.length;j++){
    marus[j].draw();
  }
    for(int j=0;j<crosss.length;j++){
    crosss[j].draw();
  }
      for(int j=0;j<triangles.length;j++){
    triangles[j].draw();
  }
}
