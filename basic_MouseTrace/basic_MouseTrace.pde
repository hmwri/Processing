//basic_MouseTrace
//draw mouse trace chara
//2022/06/13
//1-4-45 Taiyu Honma

int charaX[] = new int[50];
int charaY[] = new int[50];
void setup()
{
  size(800,800);
}

void draw()
{
  background(255);
  for(int i= 49;i > 0;i--){
    charaX[i] = charaX[i -1];
  }
  for(int i= 49;i > 0;i--){
    charaY[i] = charaY [i -1];
  }
  charaX[0] = mouseX;
  charaY[0] = mouseY;
  for(int i= 49;i >= 0;i--){
    
    drawCharacter(charaX[i],charaY[i]);
  }
}

void drawCharacter(int cx, int cy)
{
  float fScale = 0.2;
  pushMatrix();
  translate(cx-250*fScale, cy-250*fScale);
  scale(fScale);
  pushMatrix();
  // ---- kokokara --------

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
  for(int i=0;i< 200;i++){
    fill(randomColor());
    circle(w/2+random(-range,range),h/2+random(-range,range),random(5,20));
  }
  
  //draw atomosphire
  for(int i=0;i< 10;i++){
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
  ellipse(w/2-metome/2,eyeY,10,10);
  ellipse(w/2+metome/2,eyeY,10,10);
  fill(255,0,0);
  noStroke();
  
  //draw mouse
  int mouseWidth = 100;
  ellipse(w/2-mouseWidth/4,300,mouseWidth/2,80);
  ellipse(w/2+mouseWidth/4,300,mouseWidth/2,80);
  stroke(0);
  strokeWeight(2);
  line(w/2-mouseWidth/2,300,w/2+mouseWidth/2,300);
  
  // ---- kokomade --------
  popMatrix();
  popMatrix();
}

color randomColor(){
  return color(random(100,255),random(100,255),random(100,255));
}
