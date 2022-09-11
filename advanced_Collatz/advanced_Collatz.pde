//advanced_Collatz
//inspect if all natural number converges to 1 
//2022/06/27
//1-4-45 Taiyu Honma

void setup()
{
  for(int n=2;n <= 100;n++){
    collatz(n,0);
  }
  
  
  
}
int collatz(int n,int kaisu){
  print(kaisu==0 ? "\n["+n+"]":n );
  if(n == 1){
    print("("+kaisu+" steps)");
    return 0;
  }
  print("->");
  if(n%2 == 0){
    return collatz(n/2,kaisu+1);
  }else{
    return collatz(3*n+1,kaisu+1);
  }
  
}

void draw(){
}
