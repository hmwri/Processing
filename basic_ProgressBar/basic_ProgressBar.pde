//basic_ProgressBar
//Draw the progress bar
//2022/04/25
//1-4-45 Taiyu Honma
void setup(){
  size(600,300);
  frameRate(60);
}

void draw(){
  fill(255,255,255);
  rect(100,100,400,100);
  fill(255,0,0);
  rect(100,100,1000/60 * frameCount/50,100);
}
