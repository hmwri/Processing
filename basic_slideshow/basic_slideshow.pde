//basic_slideshow
//make slide show using photozou - api
//2022/11/28
//1-4-45 Taiyu Honma
void setup() {
  
  size(1200, 800);
  fill(0);
  rect(ui_w,0,width-ui_w,height);
}

void draw() {
  makeUI();
}

String[] images = null;
int current = 0;
int ui_w = 200;
int opBl = 30;
int button_y = 0;
int b_r = 40;

void makeUI() {
  fill(255);
  rect(0, 0, ui_w, height);
  button_y = height - 60;
  drawButton1(ui_w/4, button_y, opBl);
  drawButton2(ui_w/4*3, button_y, opBl);
  drawButton3("cat",ui_w/2, b_r+10, b_r*2);
  drawButton3("dog",ui_w/2, (b_r+10)*3, b_r*2);
  drawButton3("sushi",ui_w/2, (b_r+10)*5, b_r*2);
  drawButton3("ramen",ui_w/2, (b_r+10)*7, b_r*2);
}

void mousePressed() {
  if (ui_w/4-opBl < mouseX && mouseX < ui_w/4+opBl
    && button_y-opBl < mouseY && mouseY < button_y+opBl) {
    back();
    reload();
  }
  if (ui_w/4*3-opBl < mouseX && mouseX < ui_w/4*3+opBl
    && button_y-opBl < mouseY && mouseY < button_y+opBl) {
    next();
    reload();
  }
  if(dist(mouseX,mouseY,ui_w/2,b_r+10)< b_r){
    setQuery("cat");
    reload();
  };
    if(dist(mouseX,mouseY,ui_w/2,(b_r+10)*3)< b_r){
    setQuery("dog");
    reload();
  };
  if(dist(mouseX,mouseY,ui_w/2,(b_r+10)*5)< b_r){
    setQuery("sushi");
    reload();
  };
    if(dist(mouseX,mouseY,ui_w/2,(b_r+10)*7)< b_r){
    setQuery("ramen");
    reload();
  };
}

void reload() {
  if (images != null && images.length>1) {
    fill(0);
    rect(ui_w,0,width-ui_w,height);
    imageMode(CENTER);
    image(loadImage(images[current]), (width-ui_w)/2 + ui_w, height/2);
    println(current);
  }
}


void setQuery(String query) {
  current = 0;
  fill(255);
  println("loading");
  getImages(query);
  println("loaded");
}

void getImages(String query) {
  String baseURL = "https://api.photozou.jp/rest/search_public.xml?keyword=";
  String URL = baseURL + query;
  XML xml = loadXML(URL);
  XML info = xml.getChild("info");
  XML[] photos = info.getChildren("photo");
  String[] _images = new String[photos.length];
  int i=0;
  for (XML photo : photos) {
    String image_url = photo.getChild("image_url").getContent();
    _images[i] = image_url;
    i++;
  }
  images = _images;
}



void next() {
  current = min(current + 1, images.length - 1);
}
void back() {
  current = max(current - 1, 0);
}


void drawButton1(int x, int y, int l) {
  fill(100, 100, 200);
  triangle(x-l, y, x+l, y-l, x+l, y+l);
}
void drawButton2(int x, int y, int l) {
  triangle(x-l, y+l, x-l, y-l, x+l, y);
}
void drawButton3(String name,int x, int y, int r) {
  fill(200);
  ellipse(x,y,r,r);
  fill(0);
  textSize(25);
  textAlign(CENTER,CENTER-10);
  text(name, x,y);
}
