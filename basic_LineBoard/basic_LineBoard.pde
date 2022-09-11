//basic_LineBoard
//draw line board
//2022/06/13
//1-4-45 Taiyu Honma

int[] array = new int[20];
void setup()
{
  size(800,200);
  for(int i=0;i<20;i++){
    array[i] = i;
  }
}

void draw(){
  background(255);
    for(int i=0;i<20;i++){
    fill(getColor(array[i]));
    ellipse(20+40*(i),100,40,40);
  }
}
void mousePressed(){
  for(int i=0;i<20;i++){
    if(dist(20+40*(i),100,mouseX,mouseY) < 20){
      array[i] = array[i] +  1;
    };
  }
}

color getColor(int n){
  switch(n%4){
    case 0:
      return color(255);
    case 1:
      return color(255,0,0);
    case 2:
      return color(0,255,0);
    case 3:
      return color(0,0,255);
  }
  return color(255,255,0);
}
