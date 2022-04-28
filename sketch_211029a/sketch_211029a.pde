void setup(){
  size(900,900);
  background(0);
  stroke(255);
  //tree(450,900,0);
}
void tree(int sx, int sy,int i) {
  int ex = sx + int(random(-10,10));
  int ey = sy + int(random(-10,10));
  line(sx,sy,ex,ey);
  if (i<5){
    for (int j=0;j<=i;j++){
      stroke(random(255),random(255),random(255));
      tree(ex,ey,i+1);
    }
  }
}
void draw(){
 //background(0);
 if (mousePressed){
 tree(mouseX,mouseY,0);
 }
}
