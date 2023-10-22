class ExTsuda433 extends CharacterBase {
  void displayActive()
  {
    pushMatrix();
    translate(centerX, centerY);
    // ここから下にプログラムを書く

    fill(255);
    ellipse(100, 240, 70, 90);
    ellipse(160, 240, 70, 90);
    ellipse(50, 130, 100, 190);
    ellipse(210, 130, 100, 190);
    ellipse(130, 130, 210, 260);
    ellipse(130, 0, 130, 100);
    fill(0);
    ellipse(100, 0, 10, 10);
    ellipse(160, 0, 10, 10);
    line(100, 0, 160, 0);

    // ここから上にプログラムを書く
    popMatrix();
  }

  void displayInactive()
  {
    pushMatrix();
    translate(centerX, centerY);
    // ここから下にプログラムを書く

    fill(255);
    ellipse(100, 240, 70, 90);
    ellipse(170, 240, 70, 90);
    ellipse(-20, 60, 190, 60);
    ellipse(280, 60, 190, 60);
    ellipse(130, 130, 210, 260);
    ellipse(130, 0, 130, 100);
    fill(0, 0, 0);
    ellipse(100, 0, 10, 10);
    ellipse(160, 0, 10, 10);
    line(100, 0, 160, 0);


    // ここから上にプログラムを書く
    popMatrix();
  }
}
