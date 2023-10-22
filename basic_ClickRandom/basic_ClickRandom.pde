//basic_ClickRandom
//yield moving square and circle when mouse is cloicked
//2022/10/17
//1-4-45 Taiyu Honma
ArrayList<ObjectBase> objects = new ArrayList<ObjectBase>();
void setup() {
  int N = 50;
  size(800, 600);
}
void mousePressed(){
  int flag = (int)random(2);
  objects.add(flag == 0? new CircleClass(mouseX,mouseY) : new SquareClass(mouseX,mouseY));
}
void draw() {
  background(255);
  for (ObjectBase object : objects) {
    object.move();
    object.display();
  }
}
