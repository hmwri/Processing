//hw_abababab
//calc min divisor of abababab num
//2022/09/26
//1-4-45 Taiyu Honma


void setup() {
  int min = 0;
  int mina = 0;
  int minb  =0;
  for (int a=1; a<=9; a++) {
    for (int b=1; b<=9; b++) {
      int target = yakusuNum(makeabNum(a, b));
      if(a == 1 && b==1){
        min = target;
      }
      if(target < min){
        min = target;
        mina = a;
        minb = b;
      };
    }
  }
  println(min,mina,minb);
}

int digit(int num) {
  
  return int(num == 0 ? 1 :pow(10, num));
}

int makeabNum(int a, int b) {
  int result = 0;

  for (int i=0; i<8; i++) {
    result += i % 2 == 1 ? a *  digit(i): b  *digit(i);
  }
  return result;
}

int yakusuNum(int n) {
  int all = 0;
  for (int i=1; i<=n; i++) {
    if (n%i == 0) {
      all++;
    }
  }
  return all;
}
