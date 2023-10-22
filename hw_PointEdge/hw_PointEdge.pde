//hw_PointEdge
//draw point and edge avoiding intersect
//2022/10/24
//1-4-45 Taiyu Honma

ArrayList<Point> points;
ArrayList<Edge> edges;

void setup() {
  size(500, 500);
  points = new ArrayList<Point>();
  edges = new ArrayList<Edge> ();
}

void draw() {
  background(255);
  for (int i = 0; i < points.size(); i++) {
    points.get(i).display();
  }

  for (int i = 0; i < edges.size(); i++) {
    edges.get(i).display();
  }
}

void mousePressed() {
  // マウスが押されたらとりあえず点を追加
  Point p = new Point(mouseX, mouseY);
  points.add(p);
  for(Point po : points){
    Edge e = new Edge(p,po);
    boolean flag = true;
    for(Edge ed :edges){
      if(ed.intersect(e)){
        flag = false;
        break;
      }
    }
    if(flag){
      edges.add(e);
    }
    
  }
  // ここを完成させましょう


}
