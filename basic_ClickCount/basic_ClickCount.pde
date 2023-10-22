//basic_ClickCount
//save count of click
//2022/11/14
//1-4-45 Taiyu Honma

int click_count1 = 0;
int click_count2 = 0;
int click_count3 = 0;
void setup() {
  size(600,400);
  textSize(64);
  String[] lines = loadStrings("count.txt");
  if(lines != null){
    click_count1=int(lines[0]);
    click_count2=int(lines[1]);
    click_count3=int(lines[2]);
  }
}

int r  = 90;

void draw(){
  background(255);
  fill(0);
  ellipse(100,height/2,r*2,r*2);
  ellipse(300,height/2,r*2,r*2);
  ellipse(500,height/2,r*2,r*2);
  textAlign(CENTER,CENTER);
  fill(255);
  text(click_count1,100,height/2-10);
  text(click_count2,300,height/2-10);
  text(click_count3,500,height/2-10);
}

void mousePressed(){
  if(dist(100,height/2,mouseX,mouseY) < r){
    click_count1++;
  }else if(dist(300,height/2,mouseX,mouseY) < r){
    click_count2++;
  }else if(dist(500,height/2,mouseX,mouseY) < r){
    click_count3++;
  }
  
  String[] lines = new String[3];
  lines[0] = str(click_count1);
  lines[1] = str(click_count2);
  lines[2] = str(click_count3);
  saveStrings("count.txt",lines);
}
