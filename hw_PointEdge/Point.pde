// (x, y) の位置に点を作るクラス 
class Point {
  float x;
  float y;
  int radius; // 画面に描画するときの大きさ

  Point(float _x, float _y) {
    x = _x;
    y = _y;
    radius = 5;
  }

  void display() {
    strokeWeight(3);
    ellipse(x, y, radius*2, radius*2);
  }
}
