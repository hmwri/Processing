//basic_Cross
//draw cross
//2022/09/26
//1-4-45 Taiyu Honma
void setup() {
  size(500, 500);
}
int w = 80;
int h = 400;
int i = 0;
void draw() {
  background(255);
  noStroke();
  switch(i%3) {
  case 0:
    fill(255,0,0);
    break;
  case 1:
    fill(0,0,255);
    break;
  case 2:
    fill(0);
    break;
  }
  rect((width-h)/2, height/2-w/2, h, w);
  rect(width/2-w/2, (height-h)/2, w, h);
}

void mousePressed() {
  if ((aida(mouseX, (width-h)/2, (width-h)/2+h) &&
    aida(mouseY, height/2-w/2, height/2-w/2+w))
    || (aida(mouseX, width/2-w/2, width/2-w/2+w)&&
    aida(mouseY, (height-h)/2, (height-h)/2+h))
    ) {
    i++;
  }
}
boolean aida(int n, int min, int max) {
  if (min < n && n < max) {
    return true;
  }
  return false;
}
