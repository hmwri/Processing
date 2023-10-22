//hw_ClickHide
//hide circle when clicked
//2022/10/03
//1-4-45 Taiyu Honma
CircleClass[] marus = new CircleClass[20];

void setup(){
  size(600,400);
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

void mousePressed(){
  for(int j=0;j<marus.length;j++){
    if(marus[j].inspectClick()){
      break;
    };
  }
}
