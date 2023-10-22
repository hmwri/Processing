//hw_boundAll4
//write square, cross ,triangle, circle
//2022/10/10
//1-4-45 Taiyu Honma
ArrayList<ObjectBase> objects = new ArrayList<ObjectBase>();
void setup() {
  int N = 50;
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
  for (int j=0; j<N; j++) {
    objects.add(new TriangleClass());
  }
}
void draw() {
  background(255);
  for (ObjectBase object : objects) {
    object.move();
    object.display();
  }
}
