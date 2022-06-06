//advanced_Mandala
//draw mandala
//2022/05/30
//1-4-45 Taiyu Honma


//回転&グラデーションできるようにしました!


void setup(){
  size(800,800);
}


int coloroffset = 0;
float max = 0;
void draw(){
  background(255);
  drawShape(float(frameCount)/5);
  coloroffset+=3;
  frameRate(20);
  max+=0.5;
}

void drawShape(float offset){
  
  for(float i = offset;i < 64 + offset;i++){
    ellipse(400+300*cos(i*PI/32) , 400 + 300 * sin(i*PI/32),5,5);
  }
  for (int n=0; n < max; n++){
     if(isSosu(n)){
        for(float i = offset;i < 64 + offset;i++){
         colorMode(HSB);
         stroke(getColor(n));
         line(400+300*cos(i*PI/32) , 400 + 300 * sin(i*PI/32),400+300*cos((i+n)*PI/32) , 400 + 300 * sin((n+i)*PI/32));
       }
     }
   }
 }
boolean isSosu(int n){
  for(int i =2; i < n; i++){
    if(n%i == 0){
      return false;
    }
  }
  return true;
}

color getColor(int n){
  return color((n*4+coloroffset) % 256,200,255);
}
