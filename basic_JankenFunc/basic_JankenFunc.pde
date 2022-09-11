//basic_JankenFunc
//return result of janken
//2022/07/04
//1-4-45 Taiyu Honma
void setup(){
  size(300,300);
  ellipse(50,150,100,100);
  ellipse(150,150,100,100);
  ellipse(250,150,100,100);
}
void draw(){
}
int computerhand;
int ownhand; // グー:0 チョキ:1　パー:2
void mousePressed(){
  boolean in = false;
  if(dist(mouseX,mouseY,50,150) < 50){
    ownhand = 0;
    in = true;
  }
  if(dist(mouseX,mouseY,150,150) < 50){
    ownhand = 1;
    in = true;
  }
  if(dist(mouseX,mouseY,250,150) < 50){
    ownhand = 2;
    in = true;
  }
  if(!in){
    return;
  }
  println("あなたは"+inspectHand(ownhand));
  computerhand = (int)random(3);
  println("コンピュータは"+inspectHand(computerhand));
  switch(judgeJanken(ownhand,computerhand)){
    case 1:
      println("あなたの勝ち");
      break;
    case 0:
      println("引き分け");
      break;
    case -1:
      println("コンピュータの勝ち");
      break;
  }
}

String inspectHand(int n){
  switch (n) {
    case 0:
      return "グー";
    case 1:
      return "チョキ";
    case 2:
      return "パー";
  }
  return "ERROR";
}

int judgeJanken(int handA,int handB) 
{
  if(handA == handB) {
    return 0;
  }
  if(handA == 0 && handB == 1){
    return 1;
  }
  if(handA == 1 && handB == 2){
    return 1;
  }
  if(handA == 2 && handB == 0){
    return 1;
  }
  return -1;
}
