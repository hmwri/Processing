//advanced_CalcPI
//calc PI
//2022/06/27
//1-4-45 Taiyu Honma

void setup()
{
  for(int i= 1;i < 9;i ++){
    int N = (int)pow(10,i);
    println("N = "+N +" "+calcPI(N));
  }
  
}
double calcPI(int N){
  double result = 0;
  for(int k=0;k<=N;k++){
    result += (double)pow(-1,k)/((double)(2*k+1));
  }
  return result*4f;
}

void draw(){
}
