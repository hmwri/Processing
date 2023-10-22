class ExIshii306 extends CharacterBase {
  void displayActive()
  {
    pushMatrix();
    translate(centerX-248, centerY-215);
    // ここから下にプログラムを書く
    fill(100, 100, 100);
    //左腕
    ellipse(195, 250, 70, 30);
    //右腕
    ellipse(305, 250, 70, 30);
    //胴体
    ellipse(250, 250, 100, 150);
    //右足
    ellipse(280, 325, 50, 20);
    //左足
    ellipse(220, 325, 50, 20);
    fill(0, 0, 0);
    //頭
    ellipse(250, 200, 100, 95);
    fill(255, 255, 255);
    //頭２
    ellipse(250, 210, 85, 70);
    strokeWeight(1);
    //白目
    ellipse(225, 210, 12, 12);
    stroke(0, 0, 0);
    fill(0, 0, 0);
    //黒目
    ellipse(227, 212, 5, 5);
    fill(255, 255, 255);
    ellipse(270, 210, 12, 12);
    stroke(0, 0, 0);
    strokeWeight(1);
    fill(0, 0, 0);
    ellipse(268, 212, 5, 5);
    fill(255, 255, 0);
    //鼻
    ellipse(248, 215, 10, 6);
    // ここから上にプログラムを書く
    popMatrix();
  }

  void displayInactive()
  {
    pushMatrix();
    translate(centerX-248, centerY-215);
    // ここから下にプログラムを書く
    fill(100, 100, 100);
    //左腕
    ellipse(195, 250, 70, 30);
    //右腕
    ellipse(305, 250, 70, 30);
    //胴体
    ellipse(250, 250, 100, 150);
    //右足
    ellipse(280, 325, 50, 20);
    //左足
    ellipse(220, 325, 50, 20);
    fill(0, 0, 0);
    //頭
    ellipse(250, 200, 100, 95);
    fill(255, 255, 255);
    //頭２
    ellipse(250, 210, 85, 70);
    strokeWeight(1);
    //白目
    //ellipse(225, 210, 12, 12);
    stroke(0, 0, 0);
    fill(0, 0, 0);
    //黒目
     strokeWeight(1);
     noFill();
    arc(227, 208, 12, 12,0,PI);
    arc(268, 208, 12, 12,0,PI);
    fill(255, 255, 0);
    //鼻
    ellipse(248, 215, 10, 6);
    // ここから上にプログラムを書く
    popMatrix();
  }
}
