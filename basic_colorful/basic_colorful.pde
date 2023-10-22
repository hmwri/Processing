//basic_colorful
//draw colorful circles
//2022/10/03
//1-4-45 Taiyu Honma

CircleClass[] marus = new CircleClass[50];
void setup(){
  size(400,400);
      for(int j=0;j<marus.length;j++){
    marus[j] = new CircleClass();
  }
}
void draw(){
  background(255);
   for(int j=0;j<marus.length;j++){
    marus[j].draw();
  }
}
