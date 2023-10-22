//basic_DicePrime
//calc probablity of emerge pf prime
//2022/09/26
//1-4-45 Taiyu Honma
void setup() {
  float N =10000000;
  float result = 0;
  for (int i=0; i<N; i++) {
    int a = (int)random(1, 7);
    int b = (int)random(1, 7);
    int c = (int)random(1, 7);
    int num = a*100+b*10+c;
    if (isPrime(num)) {
      result++;
    };
  }
  println("素数となる確率は"+result/N);
  //result = 0;
  
  //以下検証
  //for (int a=1; a<=6; a++) {
  //  for (int b=1; b<=6; b++) {
  //    for (int c=1; c<=6; c++) {
  //      int num = a*100+b*10+c;
  //      if (isPrime(num)) {
  //        result++;
  //      };
  //    }
  //  }
  //}
  //以下検証結果 = 0.1388889 確認できた。
  //result/(6.0*6.0*6.0);
}


boolean isPrime(int n) {
  for (int i=2; i <= n/2; i++) {
    if (n%i==0) {
      return false;
    }
  }
  return true;
}
