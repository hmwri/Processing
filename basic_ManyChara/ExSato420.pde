class ExSato420 extends CharacterBase {
  void displayActive()
  {
    pushMatrix();
    translate(centerX-125, centerY-125);
    scale(0.5);
    // ここから下にプログラムを書く
    stroke(113, 76, 153);
    strokeWeight(5);
    noFill();
    ellipse(250, 200, 200, 200);
    ellipse(200, 275, 200, 200);
    ellipse(300, 275, 200, 200);


    //heads and eyes
    //1 whlie toka tukaitai
    int x=185;
    int y=190;

    fill(255);
    noStroke();
    quad(x, y, x-20, y+30, x, y+60, x+30, y);
    quad(x, y+60, x+30, y+60, x+50, y+30, x+30, y);

    stroke(113, 76, 153);
    strokeWeight(5);
    line(x, y, x-20, y+30);
    line(x-20, y+30, x, y+60);
    line(x, y+60, x+30, y+60);
    line(x+30, y+60, x+50, y+30);
    line(x+50, y+30, x+30, y);
    line(x+30, y, x, y);
    stroke(0);
    strokeWeight(15);
    point(x+15, y+30);

    //hand
    stroke(113, 76, 153);
    strokeWeight(5);
    line(x-10, y+15, x-190, y-105);


    //2
    y+=60;
    noStroke();
    quad(x, y, x-20, y+30, x, y+60, x+30, y);
    quad(x, y+60, x+30, y+60, x+50, y+30, x+30, y);

    stroke(113, 76, 153);
    strokeWeight(5);
    line(x, y, x-20, y+30);
    line(x-20, y+30, x, y+60);
    line(x, y+60, x+30, y+60);
    line(x+30, y+60, x+50, y+30);
    line(x+50, y+30, x+30, y);
    line(x+30, y, x, y);
    stroke(0);
    strokeWeight(15);
    point(x+15, y+30);
    //leg
    stroke(113, 76, 153);
    strokeWeight(5);
    line(x+15, y+60, x+15, y+360);


    //3
    x+=50;
    y+=30;
    noStroke();
    quad(x, y, x-20, y+30, x, y+60, x+30, y);
    quad(x, y+60, x+30, y+60, x+50, y+30, x+30, y);

    stroke(113, 76, 153);
    strokeWeight(5);
    line(x, y, x-20, y+30);
    line(x-20, y+30, x, y+60);
    line(x, y+60, x+30, y+60);
    line(x+30, y+60, x+50, y+30);
    line(x+50, y+30, x+30, y);
    line(x+30, y, x, y);
    stroke(0);
    strokeWeight(15);
    point(x+15, y+30);


    //4
    x+=50;
    y-=30;
    noStroke();
    quad(x, y, x-20, y+30, x, y+60, x+30, y);
    quad(x, y+60, x+30, y+60, x+50, y+30, x+30, y);

    stroke(113, 76, 153);
    strokeWeight(5);
    line(x, y, x-20, y+30);
    line(x-20, y+30, x, y+60);
    line(x, y+60, x+30, y+60);
    line(x+30, y+60, x+50, y+30);
    line(x+50, y+30, x+30, y);
    line(x+30, y, x, y);
    stroke(0);
    strokeWeight(15);
    point(x+15, y+30);
    //leg
    stroke(113, 76, 153);
    strokeWeight(5);
    line(x+15, y+60, x+15, y+360);

    //5
    y-=60;
    noStroke();
    quad(x, y, x-20, y+30, x, y+60, x+30, y);
    quad(x, y+60, x+30, y+60, x+50, y+30, x+30, y);

    stroke(113, 76, 153);
    strokeWeight(5);
    line(x, y, x-20, y+30);
    line(x-20, y+30, x, y+60);
    line(x, y+60, x+30, y+60);
    line(x+30, y+60, x+50, y+30);
    line(x+50, y+30, x+30, y);
    line(x+30, y, x, y);
    stroke(0);
    strokeWeight(15);
    point(x+15, y+30);

    //hand
    stroke(113, 76, 153);
    strokeWeight(5);
    line(x+40, y+15, x+220, y-105);


    //6
    x-=50;
    y-=30;
    noStroke();
    quad(x, y, x-20, y+30, x, y+60, x+30, y);
    quad(x, y+60, x+30, y+60, x+50, y+30, x+30, y);

    stroke(113, 76, 153);
    strokeWeight(5);
    line(x, y, x-20, y+30);
    line(x-20, y+30, x, y+60);
    line(x, y+60, x+30, y+60);
    line(x+30, y+60, x+50, y+30);
    line(x+50, y+30, x+30, y);
    line(x+30, y, x, y);
    stroke(0);
    strokeWeight(15);
    point(x+15, y+30);

    //center eye
    y+=60;
    noStroke();
    quad(x, y, x-20, y+30, x, y+60, x+30, y);
    quad(x, y+60, x+30, y+60, x+50, y+30, x+30, y);

    stroke(113, 76, 153);
    strokeWeight(5);
    line(x, y, x-20, y+30);
    line(x-20, y+30, x, y+60);
    line(x, y+60, x+30, y+60);
    line(x+30, y+60, x+50, y+30);
    line(x+50, y+30, x+30, y);
    line(x+30, y, x, y);
    stroke(0);
    strokeWeight(15);
    point(x+15, y+30);


    // ここから上にプログラムを書く
    popMatrix();
  }

  void displayInactive()
  {
    pushMatrix();
    translate(centerX-125, centerY-125);
    scale(0.5);
    // ここから下にプログラムを書く

    stroke(113, 76, 153);
    strokeWeight(5);
    fill((int)random(256),(int)random(256),(int)random(256));
    ellipse(250, 200, 200, 200);
    fill((int)random(256),(int)random(256),(int)random(256));
    ellipse(250, 200, 150, 150);
    fill((int)random(256),(int)random(256),(int)random(256));
    ellipse(200, 275, 200, 200);
    fill((int)random(256),(int)random(256),(int)random(256));
    ellipse(200, 275, 150, 150);
    fill((int)random(256),(int)random(256),(int)random(256));
    ellipse(300, 275, 200, 200);
    fill((int)random(256),(int)random(256),(int)random(256));
    ellipse(300, 275, 150, 150);


    //heads and eyes
    //1 whlie toka tukaitai
    int x=185;
    int y=190;

    fill(255);
    noStroke();
    quad(x, y, x-20, y+30, x, y+60, x+30, y);
    quad(x, y+60, x+30, y+60, x+50, y+30, x+30, y);

    stroke(113, 76, 153);
    strokeWeight(5);
    line(x, y, x-20, y+30);
    line(x-20, y+30, x, y+60);
    line(x, y+60, x+30, y+60);
    line(x+30, y+60, x+50, y+30);
    line(x+50, y+30, x+30, y);
    line(x+30, y, x, y);
    stroke(0);
    strokeWeight(30);
    point(x+15, y+30);

    //hand
    stroke(113, 76, 153);
    strokeWeight(5);
    line(x-10, y+15, x-190, y-105);


    //2
    y+=60;
    noStroke();
    quad(x, y, x-20, y+30, x, y+60, x+30, y);
    quad(x, y+60, x+30, y+60, x+50, y+30, x+30, y);

    stroke(113, 76, 153);
    strokeWeight(5);
    line(x, y, x-20, y+30);
    line(x-20, y+30, x, y+60);
    line(x, y+60, x+30, y+60);
    line(x+30, y+60, x+50, y+30);
    line(x+50, y+30, x+30, y);
    line(x+30, y, x, y);
    stroke(0);
    strokeWeight(30);
    point(x+15, y+30);
    //leg
    stroke(113, 76, 153);
    strokeWeight(5);
    line(x+15, y+60, x+15, y+360);


    //3
    x+=50;
    y+=30;
    noStroke();
    quad(x, y, x-20, y+30, x, y+60, x+30, y);
    quad(x, y+60, x+30, y+60, x+50, y+30, x+30, y);

    stroke(113, 76, 153);
    strokeWeight(5);
    line(x, y, x-20, y+30);
    line(x-20, y+30, x, y+60);
    line(x, y+60, x+30, y+60);
    line(x+30, y+60, x+50, y+30);
    line(x+50, y+30, x+30, y);
    line(x+30, y, x, y);
    stroke(0);
    strokeWeight(30);
    point(x+15, y+30);


    //4
    x+=50;
    y-=30;
    noStroke();
    quad(x, y, x-20, y+30, x, y+60, x+30, y);
    quad(x, y+60, x+30, y+60, x+50, y+30, x+30, y);

    stroke(113, 76, 153);
    strokeWeight(5);
    line(x, y, x-20, y+30);
    line(x-20, y+30, x, y+60);
    line(x, y+60, x+30, y+60);
    line(x+30, y+60, x+50, y+30);
    line(x+50, y+30, x+30, y);
    line(x+30, y, x, y);
    stroke(0);
    strokeWeight(30);
    point(x+15, y+30);
    //leg
    stroke(113, 76, 153);
    strokeWeight(5);
    line(x+15, y+60, x+15, y+360);

    //5
    y-=60;
    noStroke();
    quad(x, y, x-20, y+30, x, y+60, x+30, y);
    quad(x, y+60, x+30, y+60, x+50, y+30, x+30, y);

    stroke(113, 76, 153);
    strokeWeight(5);
    line(x, y, x-20, y+30);
    line(x-20, y+30, x, y+60);
    line(x, y+60, x+30, y+60);
    line(x+30, y+60, x+50, y+30);
    line(x+50, y+30, x+30, y);
    line(x+30, y, x, y);
    stroke(0);
    strokeWeight(30);
    point(x+15, y+30);

    //hand
    stroke(113, 76, 153);
    strokeWeight(5);
    line(x+40, y+15, x+220, y-105);


    //6
    x-=50;
    y-=30;
    noStroke();
    quad(x, y, x-20, y+30, x, y+60, x+30, y);
    quad(x, y+60, x+30, y+60, x+50, y+30, x+30, y);

    stroke(113, 76, 153);
    strokeWeight(5);
    line(x, y, x-20, y+30);
    line(x-20, y+30, x, y+60);
    line(x, y+60, x+30, y+60);
    line(x+30, y+60, x+50, y+30);
    line(x+50, y+30, x+30, y);
    line(x+30, y, x, y);
    stroke(0);
    strokeWeight(30);
    point(x+15, y+30);

    //center eye
    y+=60;
    noStroke();
    quad(x, y, x-20, y+30, x, y+60, x+30, y);
    quad(x, y+60, x+30, y+60, x+50, y+30, x+30, y);

    stroke(113, 76, 153);
    strokeWeight(5);
    line(x, y, x-20, y+30);
    line(x-20, y+30, x, y+60);
    line(x, y+60, x+30, y+60);
    line(x+30, y+60, x+50, y+30);
    line(x+50, y+30, x+30, y);
    line(x+30, y, x, y);
    stroke(0);
    strokeWeight(30);
    point(x+15, y+30);



    // ここから上にプログラムを書く
    popMatrix();
  }
}
