class ExHonma445 extends CharacterBase {
  void displayActive()
  {
    pushMatrix();
    translate(centerX-100, centerY-100);
    // ここから下にプログラムを書く
    int w = 200;
    int h = 200;
    noStroke();
    fill(200, 150, 100);
    //range of body
    int range = 80;

    //draw leg
    int legHeight = 10;
    rect(w/2+range/2, h/2+range, 20, legHeight);
    rect(w/2-range/2, h/2+range, 20, legHeight);
    fill(255, 0, 0);
    ellipse(w/2+range/2, h/2+range+legHeight, 50, 30);
    ellipse(w/2-range/2, h/2+range+legHeight, 50, 30);
    fill(200, 150, 100);

    //draw arm
    for (int i=-60; i<=60; i+=10) {
      ellipse(sin(radians(i))*150+w/2, cos(radians(i))*150, 30, 30);
    }
    stroke(0);
    fill(255);

    //draw hand
    ellipse(sin(radians(-70))*160+w/2, cos(radians(-70))*160, 30, 30);
    ellipse(sin(radians(+70))*160+w/2, cos(radians(+70))*160, 30, 30);

    //draw body
    for (int i=0; i< 200; i++) {
      fill(randomColor());
      circle(w/2+random(-range, range), h/2+random(-range, range), random(5, 20));
    }

    //draw atomosphire
    for (int i=0; i< 10; i++) {
      fill(randomColor());
      circle(w/2+random(-200, 200), h/2+random(-200, 200), random(5, 20));
    }
    fill(255);

    //draw eyes
    int metome = 40;
    circle(w/2-metome/2, 70, 20);
    circle(w/2+metome/2, 70, 20);
    fill(0);
    int eyeY =  70;
    ellipse(w/2-metome/2, eyeY, 10, 10);
    ellipse(w/2+metome/2, eyeY, 10, 10);
    fill(255, 0, 0);
    noStroke();

    //draw mouse
    int mouseWidth = 100;
    ellipse(w/2-mouseWidth/4, 140, mouseWidth/2, 80);
    ellipse(w/2+mouseWidth/4, 140, mouseWidth/2, 80);
    stroke(0);
    strokeWeight(2);
    line(w/2-mouseWidth/2, 140, w/2+mouseWidth/2, 140);
    // ここから上にプログラムを書く
    popMatrix();
  }

  void displayInactive()
  {
    pushMatrix();
    translate(centerX-100, centerY-100);
    // ここから下にプログラムを書く
    int w = 200;
    int h = 200;
    noStroke();
    fill(200, 150, 100);
    //range of body
    int range = 80;

    //draw leg
    int legHeight = 10;
    rect(w/2+range/2, h/2+range, 20, legHeight);
    rect(w/2-range/2, h/2+range, 20, legHeight);
    fill(255, 0, 0);
    ellipse(w/2+range/2, h/2+range+legHeight, 50, 30);
    ellipse(w/2-range/2, h/2+range+legHeight, 50, 30);
    fill(200, 150, 100);

    //draw arm
    for (int i=120; i<=240; i+=10) {
      ellipse(sin(radians(i))*150+w/2, cos(radians(i))*150+300, 30, 30);
    }
    stroke(0);
    fill(255);

    //draw hand
    ellipse(sin(radians(-70))*180+w/2, cos(radians(110))*150 + 290, 30, 30);
    ellipse(sin(radians(+70))*180+w/2, cos(radians(250))*150 + 290, 30, 30);

    //draw body
    for (int i=0; i< 200; i++) {
      fill(randomColor());
      circle(w/2+random(-range, range), h/2+random(-range, range), random(5, 20));
    }

    //draw atomosphire
    for (int i=0; i< 10; i++) {
      fill(randomColor());
      circle(w/2+random(-200, 200), h/2+random(-200, 200), random(5, 20));
    }
    fill(255);

    //draw eyes
    int metome = 40;
    circle(w/2-metome/2, 70, 20);
    circle(w/2+metome/2, 70, 20);
    fill(0);
    int eyeY =  70;
    ellipse(w/2-metome/2, eyeY, 10, 2);
    ellipse(w/2+metome/2, eyeY, 10, 2);
    fill(255, 0, 0);
    noStroke();

    //draw mouse
    int mouseWidth = 100;
    ellipse(w/2-mouseWidth/4, 140, mouseWidth/2, 80);
    ellipse(w/2+mouseWidth/4, 140, mouseWidth/2, 80);
    stroke(0);
    strokeWeight(2);
    line(w/2-mouseWidth/2, 140, w/2+mouseWidth/2, 140);

    // ここから上にプログラムを書く
    popMatrix();
  }
}
color randomColor() {
  return color(random(100, 255), random(100, 255), random(100, 255));
}
