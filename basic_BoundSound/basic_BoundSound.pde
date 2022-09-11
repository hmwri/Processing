//basic_BoundSound
//play bounding sounds
//2022/07/11
//1-4-45 Taiyu Honma
import ddf.minim.*;
Minim minim;
AudioSnippet crash;


class chara {
  int charaW = 40;
  int charaH = 40;
  int x;
  int y;
  float dx;
  float dy;
  PImage charaImage;
  chara(int _x,int _y,float _dx,float _dy,PImage _charaImage){
    x = _x;
    y = _y;
    dx = _dx;
    dy = _dy;
    charaImage = _charaImage;
  }
  void draw(){
    x += dx;
    y += dy;
    boolean flag = false;
    if(x > width - charaW ) {
      dx *= -1;
      x = width - charaW ;
      flag = true;
    }
    if(x < 0 ) {
      dx *= -1;
      x = 0;
      flag = true;
    }
    if(y > height - charaH ) {
      dy *= -1;
      y = height- charaH;
      flag = true;
    }
    if(y < 0 ) {
      dy *= -1;
      y = 0;
      flag = true;
    }
    if(flag){
      crash.rewind();
      crash.play();
    }
    image(charaImage,x,y,charaW,charaH);
  }
  
}
PImage backImage;
chara mikan;
chara baly;
ArrayList<chara> mikans = new ArrayList<chara>();
ArrayList<chara> balys = new ArrayList<chara>();
void setup(){
   backImage = loadImage("umi.jpg");
   for(int i=0;i<1000;i++){
     mikans.add( new chara((int)random(0,width),(int)random(0,height),random(-10,10),random(-10,10),loadImage("mikyan.png")));
     balys.add(new chara((int)random(0,width),(int)random(0,height),random(-10,10),random(-10,10),loadImage("barysan.png")));
   }
  mikan = new chara((int)random(0,width),(int)random(0,height),5,5,loadImage("mikyan.png"));
  baly = new chara((int)random(0,width),(int)random(0,height),-5,-5,loadImage("barysan.png"));
  size(1200,800);
  minim = new Minim(this);
  crash = minim.loadSnippet("crash.mp3");
}

void draw(){
  image(backImage,0,0);
  mikan.draw();
  baly.draw();
  for(chara b : balys){
    b.draw();
  }
  for(chara m : mikans){
    m.draw();
  }
}

void stop(){
  crash.close();
  minim.stop();
  super.stop();
}
