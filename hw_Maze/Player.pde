class Player extends Character{
  Key keys;

  // プレイヤークラスのインスタンス
  // コンストラクタについてはCharacterクラスを参照
  Player(Stage stg, Key keys, int x, int y, int size, int speed) {
    super(stg,x,y,size,speed);
    this.keys = keys;
  }

  void move() {  
    if (keys.isPressed('W')) {
      if (!collideWall(x, y - speed)) { 
        y -= speed;
      }
    } 
    if (keys.isPressed('S')) {
      if (!collideWall(x, y + speed)) {
        y += speed;
      }
    }
    if (keys.isPressed('A')) {
      if (!collideWall(x - speed, y)) {
        x -= speed;
      }
    } 
    if (keys.isPressed('D')) {
      if (!collideWall(x + speed, y)) {
        x += speed;
      }
    }
    
  }

}
