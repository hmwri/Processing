// Enemyクラスを継承して，
// オリジナルの敵の動き，見た目を作りましょう
class MyEnemy extends Enemy {
  int colorOffset = (int)random(255);
  boolean discover;
  // ヒント：インスタンス変数は以下の通り
  // 　　　　追加、変更してもよい

  // int x, y;  位置
  // int vx, vy;  X軸方向，Y軸方向の移動速度
  // int size;  大きさ
  // int speed; 移動速度

  MyEnemy(Stage stg, int x, int y, int size, int speed) {
    super(stg, x, y, size, speed);
    this.vx = speed;
    this.vy = speed;
  }

  // ここを実装する
  void move() {
    discover = (dist(player.x,player.y,x+size/2,y+size/2) < 60);
    if (discover) {
      vx *= player.x < x && vx > 0 ? -1: 1;
      vx *= player.x > x && vx < 0 ? -1: 1;
      vy *= player.y < y && vy > 0 ? -1: 1;
      vy *= player.y > y && vy < 0 ? -1: 1;
    }else{
      vx *= random(1) > 0.95 ? -1 : 1 ;
      vy *= random(1) > 0.95 ? -1 : 1 ;
    }
    if (!collideWall(x + vx, y)) {
      x += vx * (discover ? 1.4 :1);
    }
    if (!collideWall(x, y+vy)) {
      y += vy * (discover ? 1.4 :1);
    }
  }

  // 見た目も変えてみよう
  void display() {
    fill(0, 255, 0);
    
    
    int angry = discover ? 10 : 1;
    colorMode(RGB);
     fill(255,0,0,20);
     noStroke();
    ellipse(x+size/2,y+size/2,120,120);
    colorMode(HSB);
    stroke(0);
    fill((frameCount*angry+colorOffset)%256, 200, 200);
    rect(x, y, size, size);
    colorMode(RGB);
  }
}
