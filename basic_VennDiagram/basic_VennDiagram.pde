//basic_VennDiagram
//draw venn diagram
//2022/05/23
//1-4-45 Taiyu Honma

void setup(){
  background(255);
  size(600,400);
  textSize(40);
  fill(255,0,0);
  stroke(255,0,0);
  textAlign(CENTER,CENTER);
  text("A",200,200);
  noFill();
  ellipse(200,200,300,300);
  fill(0,0,255);
  stroke(0,0,255);
  text("B",400,200);
  noFill();
  ellipse(400,200,200,200);
}
void mousePressed(){
  if( inA() && inB()){
    println("A and B");
    return;
  }
  if(!inA() && !inB()){
    println("not A or B");
    return;
  }
  if(inA()){
    println("A only");
    return;
  }
  if(inB()){
    println("B only");
    return;
  }
}

boolean inA(){
  return dist(mouseX,mouseY,200,200) < 150;
}
boolean inB(){
  return  dist(mouseX,mouseY,400,200) < 100;
}
void draw(){
}
