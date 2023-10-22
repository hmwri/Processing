class Ball {
  int cx, cy, cd, sx, sy;
  boolean alive;

  Ball() {
    cx = (int)random(width);  // x座標初期値
    cy = (int)random(height); // y座標初期値
    cd = 20;                  // 直径
    sx = (int)random(-10, 10);// 速度x成分初期値
    sy = (int)random( -8, -3);// 速度y成分初期値
    alive = true;             // 有効
  }

  void display() {
    if (alive) {
      fill(0, 0, 255);
      ellipse(cx, cy, cd, cd);
    }
  }

  void move(Paddle pad) {
    if (alive) {
      cx = cx + sx;
      cy = cy + sy;

      // 横の壁との衝突チェック
      if (cx > width) {
        cx = width; 
        sx = -sx;
      } else if (cx < 0) {
        cx = 0;
        sx = -sx;
      }
      // Paddleとの衝突チェック
      if (cy > pad.y1) {
        if (pad.x1 < cx && cx < pad.x2) {
          cy = pad.y1;
          sy = -sy;
        }
      }

      // 上下の壁との衝突チェック
      if (cy > height) {
        alive = false;
      } else if (cy < 0) {
        cy = 0;
        sy = -sy;
      }
    }
  }
}
