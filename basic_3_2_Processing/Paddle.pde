class Paddle {
  int x1, y1, x2, y2;
  int w, h;

  Paddle() {
    w = width/4;
    h = height/20;
    x1 = (int)width/2 - w/2;   // 左上x座標初期値
    y1 = (int)height - 10 - h; // 左上y座標初期値
    x2 = (int)width/2 + w/2;   // 右下x座標初期値
    y2 = (int)height - 10 ; // 右下y座標初期値
  }

  void display() {
    fill(100, 100, 100);
    rect(x1, y1, w, h);
  }

  // val は 0〜255 それを左端〜右端に割り当てる
  void move(int val) {
    x1 = val * (width - w)/256;
    x2 = x1 + w;
  }
}
