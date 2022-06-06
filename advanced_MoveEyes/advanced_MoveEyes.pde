//advanced_MoveEyes.pde
//move eye
//2022/05/09
//1-4-45 Taiyu Honma

void draw(){
    background(0);
  int w = 500;
  int h = 500;
  noStroke();
  fill(200,150,100);
  //range of body
  int range = 100;
  
  //draw leg
  int legHeight = 100;
  rect(w/2+range/2,h/2+range,20,legHeight);
  rect(w/2-range/2,h/2+range,20,legHeight);
  fill(255,0,0);
  ellipse(w/2+range/2,h/2+range+legHeight,50,30);
  ellipse(w/2-range/2,h/2+range+legHeight,50,30);
  fill(200,150,100);
  
  //draw arm
  for(int i=-60;i<=60;i+=10){
    ellipse(sin(radians(i))*220+w/2,cos(radians(i))*220,80,80);
  }
  stroke(0);
  fill(255);
  
  //draw hand
  ellipse(sin(radians(-70))*220+w/2,cos(radians(-70))*220,100,100);
  ellipse(sin(radians(+70))*220+w/2,cos(radians(+70))*220,100,100);
  
  //draw body
  for(int i=0;i< 2000;i++){
    fill(randomColor());
    circle(w/2+random(-range,range),h/2+random(-range,range),random(5,20));
  }
  
  //draw atomosphire
  for(int i=0;i< 100;i++){
    fill(randomColor());
    circle(w/2+random(-200,200),h/2+random(-200,200),random(5,20));
  }
  fill(255);
  
  //draw eyes
  int metome = 100;
  
  circle(w/2-metome/2,200,50);
  circle(w/2+metome/2,200,50);
  fill(0);
  int eyeY =  200;
  float ecx = w/2-metome/2;
  float ecy = eyeY;
  float theta = atan2(mouseY-ecy,mouseX-ecx);
  ellipse(ecx+20*cos(theta),eyeY+20*sin(theta),10,10);
  ecx = w/2+metome/2;
  theta = atan2(mouseY-ecy,mouseX-ecx);
  ellipse(ecx+20*cos(theta),eyeY+20*sin(theta),10,10);
  fill(255,0,0);
  noStroke();
  
  //draw mouse
  int mouseWidth = 100;
  ellipse(w/2-mouseWidth/4,300,mouseWidth/2,80);
  ellipse(w/2+mouseWidth/4,300,mouseWidth/2,80);
  stroke(0);
  strokeWeight(2);
  line(w/2-mouseWidth/2,300,w/2+mouseWidth/2,300);
}
void setup(){
  size(500,500);

  
}

color randomColor(){
  return color(random(100,255),random(100,255),random(100,255));
}
