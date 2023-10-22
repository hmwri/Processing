//hw
//ブラウザを作成しました。
//Macで作業しているため、Windowsで実行すると環境の差異によって動かなくなってしまうかもしれません。
//2022/11/23
//1-4-45 Taiyu Honma

import processing.net.*;
import java.nio.charset.StandardCharsets;
import java.net.URL;

Operator operator = new Operator(this);

int bwidth = 750;
Styles styles;
void setup() {
  textSize(12);
   styles = new Styles();
  operator.request("http://localhost:1234/", "utf-8");
  //myClient.write("GET /menu.htm HTTP/1.1\nHost: abehiroshi.la.coocan.jp\nAccept-Charset: utf-8\r\n\r\n'");
  size(1200, 800);
}

void draw() {
  operator.load();
}

void mousePressed(){
  operator.clicked(mouseX, mouseY);
}

void load() {
}
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  operator.scroll(-(int)e*3);
}
void stop() {
  operator.stop();
}
