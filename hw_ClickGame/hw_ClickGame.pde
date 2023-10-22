//hw_ClickGame
//make click game
//2022/10/17
//1-4-45 Taiyu Honma
ArrayList<ObjectBase> objects = new ArrayList<ObjectBase>();
void setup() {
  int N = 5;
  size(400, 400);
  for (int j=0; j<N; j++) {
    objects.add(new SquareClass());
  }
  for (int j=0; j<N; j++) {
    objects.add(new CircleClass());
  }
  for (int j=0; j<N; j++) {
    objects.add(new CrossClass());
  }
}
boolean clear = false;
void draw() {
  boolean allDelete = true;
  background(255);
  if (clear) {
    text("CLEAR", width/2, height/2);
    return;
  }
  for (ObjectBase object : objects) {
    object.move();
    object.display();
    if (object.active) {
      allDelete = false;
    }
  }
  if (allDelete)
    clear = true;
}

void mousePressed() {
  for (ObjectBase object : objects) {
    object.isClicked();
  }
}
