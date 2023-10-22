class ExIwatsuki405 extends CharacterBase
{
  void displayActive()
  {
    pushMatrix();
    translate(centerX-250*0.5, centerY-250*0.5);
    // ここから下にプログラムを書く
    scale(0.5);
    fill(200, 10, 10);
    noStroke();
    ellipse(250, 250, 180, 300);
    rect(160, 250, 70, 200);
    rect(270, 250, 70, 200);
    fill(125, 125, 125);
    ellipse(220, 200, 150, 100);
    stroke(0, 0, 0);
    fill(200, 10, 10);
    ellipse(130, 310, 50, 60);
    ellipse(300, 310, 50, 60);

    // ここから上にプログラムを書く
    popMatrix();
  }

  void displayInactive()
  {
    pushMatrix();
    translate(centerX-250*0.5, centerY-250*0.5);
    // ここから下にプログラムを書く
    scale(0.5);
    fill(10, 10, 200);
    noStroke();
    ellipse(250, 250, 180, 300);
    rect(160, 250, 70, 200);
    rect(270, 250, 70, 200);
    fill(125, 125, 125);
    ellipse(220, 200, 150, 100);
    stroke(0, 0, 0);
    fill(10, 10, 200);
    ellipse(100, 200, 50, 60);
    ellipse(270, 200, 50, 60);

    // ここから上にプログラムを書く
    popMatrix();
  }
}
