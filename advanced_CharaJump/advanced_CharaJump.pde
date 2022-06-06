//advanced_CharaJump
//jump Character
//2022/05/16
//1-4-45 Taiyu Honma

void setup()
{
  size(1000, 800);
}

float sy = 320;
float x = 500;
float y = 483;
float v0 = 50;
float g = 9.8;
float t = 0;
boolean jumping = false;
float jumptime = 0;
FloatList times = new FloatList();

void draw()
{
  y =sy;
  if(jumptime > 0){
      t++;
      float v0s = 0;
      
      for(int i = 0; i < times.size();i++){
        times.add(i,1);
        v0s += v0*times.get(i);
      }
      y = v0s -(1.0/2.0)*g*t*t + sy;
      if(y < sy){
        t = 0;
        times = new FloatList();
        y = sy;
        jumptime = 0;
      }
  }
  background(255, 255, 255);
  drawCharacter(int(x), int(800 - y));
  fill(255);
  rect(0,700,1000,300);
  ellipse(100,100,50,50);
}


void mousePressed(){
  if(dist(100,100,mouseX,mouseY) < 25){
    jump();
  }
}

void jump(){
  jumptime++;
  times.append(0.0);
}
void drawCharacter(int cx, int cy)
{
  pushMatrix();
  translate(cx-250, cy-250);
  pushMatrix();
  // ---- kokokara --------

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
