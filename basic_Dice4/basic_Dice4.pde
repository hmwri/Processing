//basic_Dice4
//draw dice4
//2022/05/30
//1-4-45 Taiyu Honma
int N = 100000000;
void setup(){
  int result = 0;
  for(int i=0;i<N;i++){
    for(int j=0;j<4;j++){
      if((int)random(1,7) == 6){
        result+=1;
        break;
      }
    }
  }
  println((int)result/float(N));
}
