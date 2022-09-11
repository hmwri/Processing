//advanced_Sugoroku
//simulate sugoroku
//2022/06/13
//1-4-45 Taiyu Honma
int[] masu = new int[20];

int progress = 0;
void setup()
{
  textSize(40);
  //ここでマップ作成
  masu[3] = -1;
  masu[4] = -5;
  masu[5] = -2;
  masu[6] = -2;
  masu[10] = 6;
  size(1000,500);
}


void draw()
{
  background(255);
  ellipse(100,100,60,60);
  for(int i= 0;i<20;i++){
    if(i==19){
      fill(0,255,0);
    }else{
      fill(255,255,255);
      if(masu[i] < 0){
        
        fill(255,0,0);
      }
      if(masu[i] > 0){
        fill(0,0,255);
      }
    
    }
    rect(i*50,200,50,50);
    if(masu[i] != 0){
    text(masu[i],i*50,200);
    }
    fill(255,255,255);

  }
  ellipse(progress*50+25,225,50,50);
}

void mousePressed(){
  if(dist(100,100,mouseX,mouseY) < 30){
    if(progress >= 19){
      return ;
    }
    int me = (int)random(1,7);
    println(me+"の目が出ました");
    progress= min(progress+me,19);
    if(progress >= 19){
      println("Finish");
    }else{
      //戻り/進みの連鎖用
      while(progress >= 0 && progress < 20 && masu[progress] != 0){
        println(masu[progress]+"マス進みます");
        progress += masu[progress];
        
        if(progress < 0){
          progress = 0;
        }
      }
    }
    
   }
    
}
