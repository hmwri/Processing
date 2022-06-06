//advanced_CompleteGacha
//draw complete gacha game
//2022/05/23
//1-4-45 Taiyu Honma
boolean red = false;
int w = 140;
int h = 200;
button gacha = new button(100,320,200,60,"Gacha");
button reset = new button(700,320,200,60,"Reset");
void setup(){
  size(1000,400);
  textSize(40);
  textAlign(CENTER,CENTER);
  for(int i = 0;i<5;i++){
    cards.add(new card(50+(w+50)*i,100));
  }
}
class button{
  int sx,sy,w,h;
  String name;
  button(int _sx,int _sy,int _w,int _h,String _name){
    sx = _sx;
    sy = _sy;
    w = _w;
    h = _h;
    name = _name;
  }
  void draw()
  {
    fill(0);
    rect(sx,sy,w,h);
    fill(255);
    text(name,sx+w/2,sy+h/2);
  }
  Boolean on(){
    return (mouseX > sx) && (mouseX < sx + w) && (mouseY < sy + h) && (mouseY > sy);
  }
  
}
ArrayList<card> cards = new ArrayList<card>();
class card {

  int sx,sy,num;
  card(int _sx,int _sy){
    sx = _sx;
    sy = _sy;
    num = 0;
  }
  void draw(){
    if(red){
      fill(255,0,0);
    }else{
      fill(255);
    }
    rect(sx,sy,w,h);
    fill(0);
    text(num,sx+w/2,sy+h/2);
  }
  
}



void mousePressed(){
  if(gacha.on()){
    cards.get((int)random(0,5)).num++;
    boolean flag = true;
      for(card card:cards){
        if(card.num == 0){
          flag = false;
          break;
        }
      }
      if(flag){
        red = true;
      }
  }
  if(reset.on()){
    for(card card:cards){
      card.num = 0;
    }
    red = false;
  }

}

void draw(){
  background(200);
  for(card card:cards){
    card.draw();
  }
  gacha.draw();
  reset.draw();
  if(red){
    fill(255,0,0);
    text("Complete",500,350);
  }
}
