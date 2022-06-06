//basic_AmicableNumbers
//draw amicable numbers
//2022/06/06
//1-4-45 Taiyu Honma

void setup()
{
  for(int i=1;i<100000;i++){
    int n = totalYakusu(i);
    int r = totalYakusu(n);
    if(r==i&&i!=n&&i<n){
      println("("+i+","+n+")");
    }
  }
}

int totalYakusu(int n){
  int total = 0;
  for(int i=1;i < n;i++){
    if(n%i == 0){
      total+=i;
    }
  }
  return total;
}
