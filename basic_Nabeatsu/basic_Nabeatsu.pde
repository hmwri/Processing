//basic_Nabeatsu
//simulate nabeatsu
//2022/05/30
//1-4-45 Taiyu Honma
void setup(){
  for(int i=99;i>0;i--){
    if(i%3 == 0){
      println("aho");
      continue;
    }
    if(i%10 == 3){
      println("aho");
      continue;
    }
    if((i < 40)&&(i>=30)){
      println("aho");
      continue;
    }
    println(i);
  }
}
