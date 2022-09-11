//basic_TwinPrime
//calc twin prime
//2022/07/11
//1-4-45 Taiyu Honma
void setup(){
  int result = 0;
  for(int n=2;n< 1000;n++){
    if(isPrime(n) && isPrime(n+2)){
      println("("+n+", "+(n+2)+")");
      result++;
    }
  }
  println("1000までの双子素数の数は"+result+"個です");
}


boolean isPrime(int n){
  for(int i=2;i <= n/2;i++){
    if(n%i==0){
      return false;
    }
  }
  return true;
}
