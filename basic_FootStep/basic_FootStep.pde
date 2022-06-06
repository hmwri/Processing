//basic_FootStep.pde
//Draw the footstep
//2022/05/09
//1-4-45 Taiyu Honma
void setup(){
  size(300,600);
}
  int y = 0;
void draw(){
  background(255);
  fill(0);
  for(int i=0;i<30;i++){
    if(i%2==0){
      rect(0,300+10*i,300,10);
    }
  }
  y++;
  noStroke();
  fill(0);
  rect(50,y%600,100,20);
  fill(255);
  rect(150,y%600,100,20);
}
