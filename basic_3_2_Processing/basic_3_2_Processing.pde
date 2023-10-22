//basic_3_2_Processing
//ボリュームでゲームをプレイする
//2022/12/19
//1-4-45 Taiyu Honma

import processing.serial.*;
Serial my_serial;

Ball[] balls;
Paddle pad;
int val = 0; 


void setup(){
    size(400, 600);
  balls = new Ball[3];
  for (int i=0; i<balls.length; i++) {
    balls[i] = new Ball();
  }
  pad = new Paddle();
  println(Serial.list()[1]);
  my_serial = new Serial(this, Serial.list()[1], 9600);
  delay(2000);
}

void draw(){
    background(255);

  // val の値を変える
  // このサンプルではカーソルキー操作でvalの値を変える
  // ArduinoからのセンサデータをserialEventで受け取って
  // valの値を変えるようにする!
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == LEFT) {
        val -= 5;
        if (val<0) val = 0;
      } else if (keyCode == RIGHT) {
        val += 5;
        if (val>255) val = 255;
      }
    }
  }
  pad.move(val);

  // ボールを移動して描画
  for (int i=0; i<balls.length; i++) {
    balls[i].move(pad);  // ボールを移動して壁・パドルとの衝突判定
    balls[i].display();
  }

  // パドルを描画
  pad.display();
}

void serialEvent(Serial port){
  val = port.read();
}
