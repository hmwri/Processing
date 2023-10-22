// 2つのPointクラスのインスタンスから
// 辺を作るクラス
class Edge {
  Point p1;
  Point p2;

  Edge(Point _p1, Point _p2) {
    p1 = _p1;
    p2 = _p2;
  }

  void display() {
    strokeWeight(3);
    line(p1.x, p1.y, p2.x, p2.y);
  }

  // 交差するかどうか
  // http://www5d.biglobe.ne.jp/~tomoya03/shtml/algorithm/Intersection.htm
  boolean intersect(Edge e) {
    // p1とp2は自分自身の端点
    // つまり this.p1 と this.p2
    Point p3 = e.p1;
    Point p4 = e.p2;

    float ta = (p3.x - p4.x) * (p1.y - p3.y) + (p3.y - p4.y) * (p3.x - p1.x);
    float tb = (p3.x - p4.x) * (p2.y - p3.y) + (p3.y - p4.y) * (p3.x - p2.x);
    float tc = (p1.x - p2.x) * (p3.y - p1.y) + (p1.y - p2.y) * (p1.x - p3.x);
    float td = (p1.x - p2.x) * (p4.y - p1.y) + (p1.y - p2.y) * (p1.x - p4.x);

    return tc * td < 0 && ta * tb < 0;
  }
}
