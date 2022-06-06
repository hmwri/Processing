float size = 6.0;
void setup(){
  size(1000,1000);
  
  drawKessyou();
}
float p = 0;
void draw(){
  size+=0.01;
  p++;
  drawKessyou();
}

void drawKessyou(){
  push();
    for(float i  = 0;i<100;i++){
    push();
    if(i%2==0){
      translate(20*size*3,0);
    }
    rokkakkei();
    for(float j = 0; j < 100 ;j++){
      translate(40*3*size,0);
      rokkakkei();
    }
    pop();
    translate(0,size*20.0*sqrt(3)*1.0);
  }
  pop();
}

void keyPressed(){
  background(255);
  if(keyCode == UP){
    size++;
  }
    if(keyCode == DOWN){
    size--;
  }
  drawKessyou();
}
void rokkakkei(){
    for(int i=0; i < 3; i++){
    rotate(PI/3*2);
    drawShape();
  }
}

void drawShape(){
  stroke(255);
  fill(255);
  quad(p,p,20*size,20*size*sqrt(3),40*size,0,20*size,-20*size*sqrt(3));
  fill(10);
  triangle(20*size,20*size*sqrt(3),40*size,0,20*size,-20*size*sqrt(3));
  fill(0,10,100);
  quad(0,0,2*size,2*size*sqrt(3),2*size+5*size,2*size*sqrt(3),5*size,0);
  quad(0,0,2*size,-2*size*sqrt(3),2*size+5*size,-2*size*sqrt(3),5*size,0);
}
