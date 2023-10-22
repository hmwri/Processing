// 映像アニメーション表現　課題2 再実装プログラム
// Author: 本間大一優
//　ウィンドウの大きさをこちらの環境に合わせたため、ウィンドウの高さが
// 大きすぎる場合は、 適宜size関数を調整していただきたいです。

// パラメータ
//初速度(px/s)
float v0 = 100;
//重力(px/s^2)
float g = 383;





// 起動時間
float T = 3;


float interval = 0;

ArrayList<Icon> icons = new ArrayList();
PImage back = null;
void setup(){
  
  //こちらを適宜変更
  size(1800,569);
  
  frameRate(60);
  colorMode(HSB);
  for(int i= 0; i< 25; i++){
    Icon icon = new Icon(95+(52+15)*i,45,g,v0,color(i*10,255,255));
    icons.add(icon);
  }
  back = loadImage("back.png");
}

void draw(){
  background(255);
  image(back,0,0,width,height);
  fill(40);
  rect(60,height-80,width-60*2,73);
  fill(255);
  for(Icon icon: icons){
    icon.draw();
  }
}

void mousePressed() {
    for(Icon icon: icons){
    icon.on();
  }
}
