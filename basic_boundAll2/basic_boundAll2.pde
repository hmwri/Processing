//basic_boundAll2
//write program that make cross,square and circle bound with class
//2022/10/03
//1-4-45 Taiyu Honma

CircleClass[] marus = new CircleClass[5];
SquareClass[] shikakus = new SquareClass[4];
CrossClass[] crosss = new CrossClass[3];
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
}
