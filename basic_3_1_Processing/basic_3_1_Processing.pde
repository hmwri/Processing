//basic_3_1_Processing
//サーボモータをProcessingから操作する
//2022/12/19
//1-4-45 Taiyu Honma

import processing.serial.*;
Serial my_serial;

int val = 0;    // スライダが出力する値
int cx, cy, cr; // 丸の中心座標、半径

int barLength=250;  // スライダーの形状を指定する値
int leftMargin=25;
int rightMargin=60;
int barHeight=50;
int arrowLength=15;
int arrowWidth=5;




// マウスがドラッグされた時の処理
void mouseDragged() {
  int mx = mouseX;
  int my = mouseY;

  // 丸の上でドラッグされたら、マウスの位置に丸を移す
  if (dist(cx, cy, mx, my) <= cr)
    cx = mx;
  // 丸の動く範囲を制限
  if (cx<=leftMargin) cx = leftMargin;
  if (cx>=leftMargin+barLength) cx = leftMargin+barLength;

  // 丸の座標をもとに角度（0〜180）を計算
  val = (cx - leftMargin)*180/(barLength);  
  println(val);
  // 値をArduinoにシリアルで送信する　＊＊自分で書く＊＊
}
void setup(){
  size(400,400);
  println(Serial.list()[1]);
    size(335, 100);
  cx = leftMargin+barLength/2;
  cy = barHeight;
  cr = 10;

  my_serial = new Serial(this, Serial.list()[1], 9600);
}

void draw(){
  my_serial.write(val);
    background(255);

  // 横棒と矢印を描画
  stroke(0);
  line(leftMargin, barHeight, leftMargin+barLength, barHeight);
  line(leftMargin, barHeight, leftMargin+arrowLength, barHeight-arrowWidth);
  line(leftMargin, barHeight, leftMargin+arrowLength, barHeight+arrowWidth);
  line(leftMargin+barLength, barHeight, leftMargin+barLength-arrowLength, barHeight-arrowWidth);
  line(leftMargin+barLength, barHeight, leftMargin+barLength-arrowLength, barHeight+arrowWidth);

  // 両端に0と180と描画
  textSize(28);
  fill(0);
  text("0", 2, 60); 
  text("180", leftMargin+barLength, 60); 

  // cx,cyの位置に丸を描画 
  stroke(0);
  fill(255);
  ellipse(cx, cy, 2*cr, 2*cr);
}
