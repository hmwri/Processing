//basic_CalcVariance
//calc variance
//2022/07/11
//1-4-45 Taiyu Honma
float calcAverage(int[] array)
{
  int all = 0;
  for(int n:array){
    all+=n;
  }
  return float(all)/array.length;
}

float calcVariance(int[] array)
{
  float avg = calcAverage(array);
  float all = 0;
  for(int n:array){
    all+=(n-avg)*(n-avg);
  }
  return all/array.length;
}

void setup(){
  int[] scores = {80, 90, 70, 65, 100, 90, 85, 90};
  // println(calcAverage(scores));
  println(calcVariance(scores));
}
