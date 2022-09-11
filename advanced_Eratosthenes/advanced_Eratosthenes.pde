//advanced_Eratosthenes
//simulate eratosthenes
//2022/06/13
//1-4-45 Taiyu Honma

void setup(){
  println("単純な方法で組んだプログラム");
  int start = millis();
  int result1 = 0;
  for(int i= 2;i<1000000 ;i++){
    if(normal(i)){
      result1++;
    };
  };
  int end = millis();
  println("2から100万までの素数は"+result1+"個");
  println("計算にかかった時間は"+(end-start)+"ミリ秒です");
  boolean[] array = new boolean[1000001];
  for(int i=0;i<1000001;i++){
    array[i] = true;
  }
  println("エラストステネスのふるいで組んだプログラム");
  start = millis();
  int result2 = 0;
  for(int num = 2;num <= 1000000;num++){
    if(array[num]){
      result2++;
      for(int i= 0;i<=1000000/num;i++){
        array[num*i] = false;
      }
    }
    
  }
  end = millis();
  println("2から100万までの素数は"+result2+"個");
  println("計算にかかった時間は"+(end-start)+"ミリ秒です");
  
}

boolean normal(int n){
  for(int i = 2;i <= n/2 ;i++){
    if(n%i == 0){
      return false;
    }
  }
  return true;
};
