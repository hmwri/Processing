//basic_Pixel
//draw pixel from up to down
//2022/05/30
//1-4-45 Taiyu Honma
void setup(){
  background(255);
  size(600,400);
  noFill();
  ellipse(200,200,300,300);
  ellipse(400,200,200,200);
}
int y = 0;
void draw(){
  for(int x = 0;x < 600 ; x++){
    if(inA(x) && inB(x)){
      stroke(0,0,0);
      point(x,y);
      continue;
    }
   if(inA(x)){
      stroke(255,0,0);
      point(x,y);
      continue;
    }
    if(inB(x)){
      stroke(0,0,255);
      point(x,y);
      continue;
    }
    stroke(100);
    point(x,y);
  };
  y++;
}
boolean inA (int x){
  return dist(x,y,200,200) < 150;
}
boolean inB (int x){
  return dist(x,y,400,200) < 100;
}
