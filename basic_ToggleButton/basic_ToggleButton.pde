//basic_ToggleButton
//make a togle button
//2022/05/16
//1-4-45 Taiyu Honma

void setup()
{
  size(900,300);
}
boolean en1 = true;
boolean en2 = true;
boolean en3 = true;
void draw(){
  if(en1){
    fill(255);
  }else{
    fill(0);
  }
  ellipse(150,150,100,100);
  if(en2){
    fill(255);
  }else{
    fill(0);
  }
  ellipse(450,150,150,150);
  if(en3){
    fill(255);
  }else{
    fill(0);
  }
  ellipse(750,150,200,200);
}
void mousePressed(){
  if(dist(mouseX,mouseY,150,150) < 50){
    en1 = !en1;
  }
  if(dist(mouseX,mouseY,450,150) < 75){
    en2 = !en2;
  }
  if(dist(mouseX,mouseY,750,150) < 100){
    en3 = !en3;
  }
}
