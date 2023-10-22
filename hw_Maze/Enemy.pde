class Enemy extends Character {
  float vx, vy; // X軸方向，Y軸方向の移動速度

  Enemy(Stage stg, int x, int y, int size, int speed) {
    super(stg, x, y, size, speed);

  }

  // 敵の動きを制御するメソッド
  void move() { 
    
    // ランダムな確率でX軸方向の向きを変更する
    vx *= player.x < x ? -1: 1;
    
    // 移動させるときは，壁との接触判定を行う
    // !collideWall(x + vx, y) は，
    // 「x 座標を vx 分だけ移動させた位置が壁ではない」という意味
    // この判定なしに移動させると，壁をすり抜けてしまいます
    if (!collideWall(x + vx, y)) {
      x += vx;
    }
  }

  // 敵を描画するメソッド
  void display() {
    fill(0, 0, 255);    
    stroke(0);
    rect(x, y, size, size);
  }
}
