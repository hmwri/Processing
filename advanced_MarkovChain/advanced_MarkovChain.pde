//advanced_MarkovChain
//simulate markov
//2022/06/06
//1-4-45 Taiyu Honma

void setup()
{
  int Akati = 0;
  int Bkati = 0;
  int draw = 0;
  int preA = -1;
  int preB = -1;
  int preBResult = -1;
  // 0 勝ち, 1 引き分け 2負け
  for(int i=0;i < 1000000;i++)
  {
    int A = -1;
    int B = -1;
    if(i==0){
      A = (int)random(3);
      B = (int)random(3);
      preA = A;
      preB = B;
      preBResult = syohai(B,A);
      switch (syohai(A,B)) {
        case 0:
          Akati++;
          break;
        case 1:
          draw++;
          break;
          
        case 2:
          Bkati++;
          break;
      };
      
    }

    switch(preA){
      case 0:
        A = randomFunc(1,1,8);
        break;
      case 1:
        A = randomFunc(1,1,8);
        break;
      case 2:
        A = randomFunc(2,3,5);
        break;
    }
    preA = A;
    switch(preBResult){
      case 0:
        switch(randomFunc(8,2,0)){
          case 0:
            B = preB;
            break;
          case 1:
            B = tigaute(preB);
            break;
        }
        case 1:
          switch(randomFunc(5,5,0)){
            case 0:
              B = preB;
              break;
            case 1:
              B = katsute(preB);
              break;
          }
          break;
        case 2:
          B = katsute(preB);
          break;
      }
      preBResult = syohai(B,A);
      switch (syohai(A,B)) {
        case 0:
          Akati++;
          break;
        case 1:
        draw++;
        break;
        case 2:
        Bkati++;
        break;
        
      };
          if(preA == -1|| A== -1|| B== -1){
      println("ERROR!");
      return;
    }
     
    }
    println("Aの勝利数"+Akati);
    println("Bの勝利数"+Bkati);
    println("引き分け数",draw);
    }

void draw()
{
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
int katsute(int aite){
  if(aite == 0){
    return 2;
  }
  if(aite == 1)
  {
    return 0;
  }
  if(aite == 2){
    return 1;
    
  }
  return -1;
}
int tigaute(int preB){
  int r = randomFunc(5,5,0);
     if(preB == 0){
         if(r == 0){
                return 2;
          }else{
                return 1;
          }
      }
            if(preB == 1){
              if(r == 0){
                return 0;
              }else{
                return 2;
              }
            }
            if(preB == 2){
              if(r == 0){
                return 1;
              }else{
                return  0;
              }
            }
            return -1;
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
  return -1;
}
