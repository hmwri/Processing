//basic_Gacha100
//simulate gacha
//2022/06/13
//1-4-45 Taiyu Honma

void setup()
{
  size(800,400);

}
int[] items = new int[100];
void mousePressed(){
  if(dist(100,100,mouseX,mouseY) < 40 ){
    for(int i=0;i <50;i++)
    {
      int result = (int)random(0,100);
      items[result] += 1;
    }
    int most = 0;
    for(int i=0;i <100;i++)
    {
      if(items[i] > most){
        most = items[i];
      }
    }
    println("一番多いアイテムは"+most+"個");
  }
}

void draw()
{
  background(255);
    fill(255,0,0);
  ellipse(100,100,80,80);
  
  fill(0);
  for(int i= 0;i<100;i++)
  {
    rect(i*8,height-items[i],8,items[i]);
  }
}
