//advanced_ThreeCards
//three cards
//2022/07/04
//1-4-45 Taiyu Honma
void setup(){
  size(500,1000);
}

int calc(int n) {
  int min = 0;
  for(int j = 0;j< 1000;j++){
    int[] ns = new int[n];
    for(int i=1;i<n+1;i++){
      int index;
      while(true){
        index = (int)random(0,n);
        if(ns[index] == 0){
          break;
        }
      }
      ns[index] = i;
    }
    int max = 0;
    for(int  i=0;i<n;i++){
      int num = 0;
      if(i == 0) {
        num = ns[n-1] + ns[0] + ns[1];
      }
      else if(i == n - 1) {
        num = ns[n-2] + ns[n-1] + ns[0];
      } else {
        num = ns[i]+ns[i+1]+ns[i-1];
      }
      if(max < num){
        max = num;
      }
    }
    if( j == 0 ){
      min = max;
    }else {
      if(min > max) {
        min = max;
      }
    }
  }
  return min;

}
int preResult = calc(3);
void draw(){
  int n  = frameCount+2;
  int result = calc(n);
  println(n + ","+result);
  stroke(255,0,0);
  if(n != 3){
      line(n-1,height-preResult,n,height-result);
      stroke(0,0,255);
      line(n-1,height-3.0/2.0*(float(n-1)+1.0),n,height-3.0/2.0*(float(n)+1.0));
  }
  preResult = result;
}
