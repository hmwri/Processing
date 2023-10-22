//hw_ImageProc
//display 4 filtered images 
//2022/10/17
//1-4-45 Taiyu Honma

void setup(){
  size(700,828);
  PImage img1 = loadImage("abe.jpg");
  PImage img2 = loadImage("abe.jpg");
  PImage img3 = loadImage("abe.jpg");
  PImage img4 = loadImage("abe.jpg");
  image(img1,0,0);
  img2.filter(THRESHOLD);
  image(img2,350,0);
  img4.filter(INVERT);
  image(img4,350,414);
  img3.filter(BLUR,5);
  image(img3,0,414);

  
  
}

void draw(){
}
