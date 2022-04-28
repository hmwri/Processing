import processing.net.*;

Client myClient;

int bgcolor = 30;
class textObj {
  int x,size;
  int y = 0;
  String str;
  int[] Col;
  int CreatedTime;
  textObj(int _x, int _size, String _str,int[] _col){
    this.x = _x;
    this.size = _size;
    this.str = new String(_str);
    this.Col = _col;
    this.CreatedTime = frameCount;
  }
  void draw() {
    fill(Col[0],Col[1],Col[2]);
    move();
    textSize(size);
    text(str,x,y);
  }
  void move (){
    this.y = this.y + 6;
  }
}
class trackText extends textObj {
  int ThisCreatedTime;
  trackText(textObj o) {
    super(o.x,o.size,o.str,o.Col);
    this.y = o.y;
    this.Col = new int[]{200,200,200};
    this.ThisCreatedTime = frameCount;
  }
  void draw() {
    int b = 100 - (frameCount - this.ThisCreatedTime) * 2;
    if (b >= 0) {
    fill(Col[0]-40,Col[1]-40,Col[2]-40,b);
    textSize(this.size);
    text(str,this.x,this.y);
    }
  }
}
String data;
void setup() {
  myClient = new Client(this,"192.168.1.4",8080);
  size(1680,1050);
  background(bgcolor);
}
Boolean firstTalk = true;
ArrayList<textObj> texts = new ArrayList<textObj>();
ArrayList<trackText> tracks = new ArrayList<trackText>();
final int w = 1680;
final int h = 1050;
int cx = w/2;
int cy = h/2;
int Count = 0;
void draw() {
  background(bgcolor);
  if (myClient.available() > 0) {
    Count++;
    texts.add(new textObj(int(random((Count%4)*w/4+100,(Count%4+1)*w/4-100)),int(random(120,180)),getChar(),randomCol()));
  }
  for (int i = 0; i < tracks.size();i++){
    var track = (trackText)tracks.get(i);
    track.draw();
  }
  for (int i = 0; i < texts.size();i++){
    var text = (textObj)texts.get(i);
    if ((text.CreatedTime - frameCount) % 3 == 0){
      tracks.add(new trackText(text));
    }
    text.draw();
  }

}

String getChar() {
    data = myClient.readString().substring(0,1).toUpperCase();
    return data;
}

int[] randomCol(){
  int min = 220;
  int max = 256;
  return new int[]{int(random(min,max)),int(random(min,max)),int(random(min,max))};
}


void keyPressed() {
  myClient.write(key);
}
