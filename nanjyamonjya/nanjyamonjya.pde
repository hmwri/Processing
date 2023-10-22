int CHARA_NUM = 4;
int CHARA_BOX_SIZE = 4;
int CHARA_BOX_W = 100;
int LIMIT = 3;

boolean displayAnswer = false;
boolean rotate = true;
boolean scale = false;

import javax.swing.*;
import java.awt.*;

JLayeredPane pane;
JTextField field;
JTextArea area;


void setup() {
  Canvas canvas = (Canvas) surface.getNative();
  pane = (JLayeredPane) canvas.getParent().getParent();
  PFont font = createFont("YuGo-Medium", 40);
  textFont(font);

  // 1行のみのテキストボックスを作成
  field = new JTextField();
  field.setFont(new Font("ＭＳ ゴシック", Font.BOLD, 70));
  field.setBounds(width/2 - 200, height -150, 400, 80);
  pane.add(field);
  fill(255, 0, 0);
  ellipse(width-100, height-100, 60, 60);
  fill(0);
  size(1000, 700);
  for (int i=0; i < CHARA_NUM; i++) {
    boolean[][] _body = randomBody(CHARA_BOX_SIZE, CHARA_BOX_SIZE);
    charas.add(new chara(_body, int(width/2 - CHARA_BOX_W * CHARA_BOX_SIZE/2.0), int(height/2 - CHARA_BOX_W * CHARA_BOX_SIZE/2.0) ));
  }
}
ArrayList<chara> charas = new ArrayList<chara>();
void draw() {
}



boolean[][] body;
int i = 0;
int nowChara = -1;
void mousePressed() {
  if(i > LIMIT) {
    return;
  }
  if (dist(mouseX, mouseY, width-100, height-100) < 30) {
    chara nc = null;
    boolean answer = false;
    if (nowChara != -1) {
      nc = charas.get(nowChara);
      if (nc.showd && !displayAnswer) {
        answer = true;
      }
      nc.setName(field.getText());
      nc.showd = true;
    }
    int random = (int)random(CHARA_NUM);
    while (random == nowChara) {
      random = (int)random(CHARA_NUM);
    }
    println(nowChara);
    chara c = charas.get(random);
    display(c);
    if(answer){
        fill(255, 0, 0);
        textAlign(CENTER, CENTER);
        textSize(40);
        text("答え:"+nc.name, width/2, 100);
        i+=1;
    }
    nowChara = random;
  };
}



void display(chara c) {
  background(200);
  int w = int(CHARA_BOX_W * (scale ? random(0.5, 1.5) : 1.0));
  int r = rotate ? (int)random(4) : 0;
  if(!c.showd) {
    c.draw();
  }else{
  for (int y=0; y < 10; y++) {
    for (int x=0; x < 10; x++) {
      c.draw(x*CHARA_BOX_SIZE * w, y*CHARA_BOX_SIZE * w, w, w, r);
    }
  }
  }
  fill(255, 0, 0);
  ellipse(width-100, height-100, 60, 60);
  fill(0);
  if (c.showd && displayAnswer) {
    fill(255, 0, 0);
    textAlign(CENTER, CENTER);
    textSize(40);
    text("答え:"+c.name, width/2, 100);
    i+=1;
  }
}
