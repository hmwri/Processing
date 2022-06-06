float x = 0;
float y = 0;
float t = 0;
float  n = 1000;
float zoom = 200;
void setup(){
  size(1000,1000);
  translate(500,500);
  drawShape();
}

void draw(){
}

void drawShape(){
  
    for(float x = -500;x < 500; x++){
    if(x % 100 == 0){
      textAlign(CENTER);
      text(int(x/zoom),x,0);
    }
  }
  for(float y = -500;y < 500; y++){
    if(y % 100 == 0){
      text(int(-y/zoom),0,y);
    }
  }
  for(float t=0.5*PI; t < PI*2.5;t+=(2*PI/n)){
    float x = (sin(t)+1)*cos(t);
    float y = (sin(t)+1)*sin(t);
    noStroke();
    fill((t-0.5*PI)*(float(256)/(PI*2)),0,0);
    println((t-0.5*PI)*(float(256)/(PI*2)));
    ellipse(x*zoom,-y*zoom,3,3);
  }
}
void mousePressed(){
  translate(500,500);
  background(255);
  zoom += 10;
  drawShape();
}
