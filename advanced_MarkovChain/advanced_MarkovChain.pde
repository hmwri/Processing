//advanced_MarkovChain
//simulate markov
//2022/06/06
//1-4-45 Taiyu Honma
int Akati = 0;
int Bkati = 0;
int draw = 0;
void setup()
{
  // 0 勝ち, 1 引き分け 2負け
  // 0 グー 1　ちょき 2パー
  int A = (int)random(3);
  int B = (int)random(3);
  shohaiCount(syohai(A,B));
  for(int i=1;i < 1000000;i++)
  {
    int nextA = -1;
    switch(A){
      case 0:
        nextA = randomFunc(1,1,8);
        break;
      case 1:
        nextA = randomFunc(1,1,8);
        break;
      case 2:
        nextA = randomFunc(2,3,5);
        break;
    }
    int nextB  = -1;
    switch(syohai(B,A)){
      case 0:
        switch(randomFunc(8,1,1)){
          case 0:
            nextB = B;
            break;
          case 1:
            nextB = (B+1)%3;
            break;
          case 2:
            nextB = (B+2)%3;
            break;
        }
        case 1:
          switch(randomFunc(5,5,0)){
            case 0:
              nextB = B;
              break;
            case 1:
              nextB = katsute(A);
              break;
          }
          break;
        case 2:
          nextB = katsute(A);
          break;
    }
    A = nextA;
    B = nextB;
    shohaiCount(syohai(A,B));
    }
    println("Aの勝利数"+Akati);
    println("Bの勝利数"+Bkati);
    println("引き分け数",draw);
}

int syohai(int a,int b){
  int c = (a-b+3)%3;
  if(c==0){
    return 1;
  }
  if(c==1){
    return 2;
  }
  return 0;
}
void shohaiCount(int r){
  switch(r){
     case 0:
       Akati++;
       break;
     case 1:
       draw++;
       break;
     case 2:
       Bkati++;
       break;
  }
}
int katsute(int aite){
  if(aite == 0){
    return 2;
  }
  if(aite == 1)
  {
    return 0;
  }
  return 1;
}
int tigaute(int preB){
  int r = randomFunc(5,5,0);
  return (preB+r)%3;
}
int randomFunc(int a,int b,int c){
  int r = (int)random(10);
  if(r < a){
    return  0;
  }
  if(r < a+b){
    return 1;
  }
  if(r < a+b+c){
    return 2;
  }
  println("ERROR");
  return -1;
}
