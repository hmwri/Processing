class ExIshida308 extends CharacterBase
{
  void displayActive()
  {
    pushMatrix();
    translate(centerX,centerY);
    // ここから下にプログラムを書く
    //boushi
    fill(0,0,0);
    arc(250,150,100,100,3.14,6.28);
    fill(240,0,0);
    arc(250,150,100,20,3.14,6.28);
    //gannmennnorinnkaku
    noStroke();
    fill(240,200,200);
    arc(250,150,100,120,0,3.14);
    //medama
    fill(255,255,255);
    ellipse(230,170,20,20);
    ellipse(270,170,20,20);
    fill(0,0,0);
    ellipse(230,170,10,15);
    ellipse(270,170,10,15);
    //kuchi
    fill(250,0,0);
    arc(250,190,20,20,0,3.14);
    //kubi
    fill(240,200,200);
    quad(240,209,240,220,260,220,260,209);
    //uniform
    fill(255,50,50);
    quad(200,220,300,220,300,310,200,310);
    //pants
    fill(255,255,255);
    quad(200,310,200,410,240,410,240,310);
    quad(240,310,240,410,250,340,250,310);
    quad(300,310,300,410,260,410,260,310);
    quad(260,310,260,410,250,340,250,310);
    stroke(0,0,0);
    line(200,310,200,410);
    line(200,410,240,410);
    line(240,410,250,340);
    line(250,340,260,410);
    line(260,410,300,410);
    line(300,410,300,310);
    strokeWeight(5);
    stroke(255,50,50);
    line(290,310,290,400);
    strokeWeight(3);
    stroke(0,0,0);
    line(240,225,240,310);
    line(260,225,260,310);
    strokeWeight(10);
    line(205,310,295,310);
    //hidariude
    strokeWeight(1);
    noStroke();
    fill(0,0,0);
    quad(200,220,200,250,175,295,160,280);
    //migiude
    quad(300,220,300,250,325,295,340,280);
    //undershirts
    fill(255,50,50);
    quad(200,220,180,250,195,265,200,250);
    quad(300,220,320,250,305,265,300,250);
    //kubimoto
    fill(240,200,200);
    arc(250,220,40,30,0,3.14);
    //ryouashi
    fill(0,0,0);
    ellipse(211,415,60,30);
    ellipse(289,415,60,30);
    //ryoute
    fill(255,255,255);
    stroke(0,0,0);
    ellipse(168,290,30,30);
    ellipse(332,290,30,30);
    // ここから上にプログラムを書く
    popMatrix();
  }
  
  void displayInactive()
  {
    pushMatrix();
    translate(centerX, centerY);
    // ここから下にプログラムを書く
    //boushi
    fill(0,0,0);
    arc(250,150,100,100,3.14,6.28);
    fill(240,0,0);
    arc(250,150,100,20,3.14,6.28);
    //gannmennnorinnkaku
    noStroke();
    fill(240,200,200);
    arc(250,150,100,120,0,3.14);
    //medama
    fill(255,255,255);
    ellipse(230,170,20,20);
    ellipse(270,170,20,20);
    fill(0,0,0);
    stroke(0);
    strokeWeight(5);
    line(225,170,235,170);
    line(265,170,275,170);
    //kuchi
    stroke(250,0,0);
    strokeWeight(5);
    line(240,190,260,190);
    //kubi
    strokeWeight(1);
    noStroke();
    fill(240,200,200);
    quad(240,209,240,220,260,220,260,209);
    //uniform
    fill(255,50,50);
    quad(200,220,300,220,300,310,200,310);
    //pants
    fill(255,255,255);
    quad(200,310,200,410,240,410,240,310);
    quad(240,310,240,410,250,340,250,310);
    quad(300,310,300,410,260,410,260,310);
    quad(260,310,260,410,250,340,250,310);
    stroke(0,0,0);
    line(200,310,200,410);
    line(200,410,240,410);
    line(240,410,250,340);
    line(250,340,260,410);
    line(260,410,300,410);
    line(300,410,300,310);
    strokeWeight(5);
    stroke(255,50,50);
    line(290,310,290,400);
    strokeWeight(3);
    stroke(0,0,0);
    line(240,225,240,310);
    line(260,225,260,310);
    strokeWeight(10);
    line(205,310,295,310);
    //hidariude
    strokeWeight(1);
    noStroke();
    fill(0,0,0);
    quad(200,220,200,250,175,295,160,280);
    //migiude
    quad(300,220,300,250,325,295,340,280);
    //undershirts
    fill(255,50,50);
    quad(200,220,180,250,195,265,200,250);
    quad(300,220,320,250,305,265,300,250);
    //kubimoto
    fill(240,200,200);
    arc(250,220,40,30,0,3.14);
    //ryouashi
    fill(0,0,0);
    ellipse(211,415,60,30);
    ellipse(289,415,60,30);
    //ryoute
    fill(255,255,255);
    stroke(0,0,0);
    ellipse(168,290,30,30);
    ellipse(332,290,30,30);
    // ここから上にプログラムを書く
    popMatrix();
  }
}
