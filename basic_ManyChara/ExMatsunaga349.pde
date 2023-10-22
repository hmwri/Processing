class E1Matsunaga349 extends CharacterBase {
  void displayActive()
  {
    pushMatrix();
    translate(centerX-250, centerY-280);
    // ここから下にプログラムを書く

    fill(204, 102, 0);
    ellipse(120, 150, 100, 100);
    fill(204, 102, 0);
    ellipse(380, 150, 100, 100);
    fill(255, 215, 0);
    ellipse(115, 170, 70, 70);
    fill(255, 215, 0);
    ellipse(380, 170, 70, 70);
    //体
    fill(204, 102, 0);
    ellipse(250, 400, 200, 180);
    //顔
    ellipse(250, 250, 300, 250);
    //手
    ellipse(150, 400, 50, 50);
    ellipse(350, 400, 50, 50);
    //足
    ellipse(200, 460, 50, 50);
    ellipse(300, 460, 50, 50);
    //目 
    fill(102, 0, 0);
    ellipse(190, 270, 30, 30);
    fill(102, 0, 0);
    ellipse(310, 270, 30, 30);
    //口
    fill(255, 255, 255);
    ellipse(250, 310, 90, 70);
    //鼻
    fill(102, 0, 0);
    ellipse(250, 300, 20, 20);
  

  // ここから上にプログラムを書く
  popMatrix();
}

void displayInactive()
{
  pushMatrix();
  translate(centerX-250, centerY-280);
  // ここから下にプログラムを書く

  fill(204, 102, 0);
ellipse(120, 150, 100,100);
fill(204, 102, 0);
ellipse(380, 150, 100,100);
fill(255, 215, 0);
ellipse(115, 170, 70, 70);
fill(255, 215, 0);
ellipse(380, 170, 70, 70);
//体
fill(204, 102, 0);
ellipse(250, 400, 200,180);
//顔
ellipse(250, 250, 300,250);
//手
ellipse(150, 400, 50,50);
ellipse(350, 400, 50,50);
//足
ellipse(200, 460, 50,50);
ellipse(300, 460, 50,50);
//目 
fill(102, 0, 0);
ellipse(190, 270, 50, 50);
fill(102, 0, 0);
ellipse(310, 270, 50, 50);
//口
fill(255, 255, 255);
ellipse(250, 310, 90, 70);
//鼻
fill(102, 0, 0);
ellipse(250, 300, 20, 20);


  // ここから上にプログラムを書く
  popMatrix();
}
}
