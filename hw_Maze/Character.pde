class Character {
  Stage stage; // そのキャラクタが置かれているStage
  int x, y; // 位置
  int size; // 大きさ
  int speed; // 移動速度

  // コンストラクタ
  Character(Stage stg, int x, int y, int size, int speed) {
    this.stage = stg;
    this.x = x;
    this.y = y;
    this.size = size;
    this.speed = speed;
  }

  // キャラクターの処理をまとめておく関数
  // キャラクターの制御をするときはこれだけ呼べばOKとしてしまう
  void update() {
    move();
    display();
  }

  // 表示
  void display() {
    fill(255, 0, 0);
    ellipse(x+size/2, y+size/2, size, size);
  }

  // 移動
  void move() {
  }

  // ある座標を渡したときに，
  // その座標がキャラクタの内部にある（ぶつかっている）か判定
  boolean collide(float tx, float ty) {
    if (x < tx && tx < x + size && y < ty && ty < y + size) {
      return true;
    }
    return false;
  }

  // そのキャラクタがいるステージに対して，
  // 壁にぶつかっているかどうかチェックさせる関数
  boolean collideWall(float tx, float ty) {
    if (stg.collide(tx, ty) ||
      stg.collide(tx+size, ty) ||
      stg.collide(tx, ty+size) ||
      stg.collide(tx+size, ty+size)) {
      return true;
    } else {
      return false;
    }
  }

  // それぞれステージ上のどのセルにいるか，
  // 配列のインデックスを返す
  int posX_Stage() {
    return stage.position_X(x+size/2);
  }
  
  int posY_Stage() {
    return stage.position_Y(y+size/2);
  }
}
