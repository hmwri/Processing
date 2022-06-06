//basic_Janken
//do janken
//2022/05/23
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
  if(ownhand == computerhand){
    println("引き分け");
    return;
  }
  if(iskati(ownhand,computerhand)){
    println("あなたの勝ち");
  }else{
    println("コンピュータの勝ち");
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

boolean iskati(int own,int comp) {
  if(own == 0 && comp == 1){
    return true;
  }
  if(own == 1 && comp == 2){
    return true;
  }
  if(own == 2 && comp == 0){
    return true;
  }
  return false;
}
