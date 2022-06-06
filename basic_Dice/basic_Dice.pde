//basic_Dice.pde
//simulate a dice
//2022/05/16
//1-4-45 Taiyu Honma

void setup()
{
  size(400,300);

}
void mousePressed(){
  int a = (int)random(1,7);
  println("Aさん:"+ a);
  int b1 = (int)random(1,7);
  int b2 = (int)random(1,7);
  int b = b1+b2;
  println("Bさん:"+b);
  if(a > b){
    println("Aさんの勝ち");
    return;
  }
  if(a < b){
    println("Bさんの勝ち");
    return;
  }
  println("引き分け");
}

void draw(){
}
