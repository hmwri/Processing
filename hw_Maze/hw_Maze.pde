//hw_Maze
//create maze with class
//2022/10/24
//1-4-45 Taiyu Honma

// ==========
//  Key
//  W,A,S,D : Move
// ==========

Stage stg;
Player player;
Key keys;
ArrayList<Enemy> enemies_list;
int PLAY_TIME; // ゲーム開始時点の時間

// 定数
int STAGE_SIZE = 31; // 迷路生成の都合で奇数に
int STAGE_CELL_SIZE = 20; // ステージの1マスの大きさ
int ENEMY_NUM = 10; // 敵の数

void setup() {
  size(620, 620); // ステージが収まるサイズに

  // Keyクラスをインスタンス化 
  keys = new Key();
  // Stageクラスをインスタンス化
  stg = new Stage(STAGE_SIZE, STAGE_SIZE, STAGE_CELL_SIZE);
  // Playerクラスをインスタンス化
  player = new Player(stg, keys, 
    STAGE_CELL_SIZE+3, STAGE_CELL_SIZE+3, STAGE_CELL_SIZE-6, 2);

  // 開始時の時間を記録
  PLAY_TIME = millis();

  // 敵を作成 ここから ======================================================
  enemies_list = new ArrayList<Enemy>();
  for (int i = 0; i < ENEMY_NUM; i++) {
    int e_posX = (int)random(stg.x);
    int e_posY = (int)random(stg.y);
    
    // もし座標が壁の中だったらやり直し
    while (stg.field[e_posX][e_posY] == 1) {
      e_posX = (int)random(stg.x);
      e_posY = (int)random(stg.y);
    }
    int enemy_pos_x = e_posX*stg.cellsize+2;
    int enemy_pos_y = e_posY*stg.cellsize+2;


    // ==========================================================
    // 新しくクラスを作った場合はここを書き換えましょう
    // 例：　Enemy -> MyEnemy
    // 引数：ステージクラスのインスタンス，初期位置X，初期位置Y，大きさ，移動速度
    
    Enemy enemy = new MyEnemy(stg, enemy_pos_x, enemy_pos_y, STAGE_CELL_SIZE-4, 1);   
    enemies_list.add(enemy);
    
    // 「大きさ」は STAGE_CELL_SIZE よりも少し小さければOK
    //　ピッタリサイズだと、角をうまく曲がれなかったりするため
    
    // ==========================================================

  }
  
  // 敵を作成 ここまで ======================================================
  
  stg.setPlayer(player); // ステージにPlayerのインスタンスを設定
  stg.setEnemies(enemies_list); // ステージにEnemyのインスタンスを設定
}

void draw() {
  background(255);
  
  // ステージの描画
  stg.display();
  
  // プレイヤーの処理
  player.update();

  // 敵の処理
  boolean found = false;
  for (int i = enemies_list.size()-1; i >= 0; i--) {
    Enemy e = enemies_list.get(i);
    e.update();
    
    if (e instanceof MyEnemy){
      if(((MyEnemy)e).discover) {
        found = true;
      }
    }
  }
  if(found) {
    textSize(100);
    fill(0,0,0,100);
    textAlign(CENTER,CENTER);
    text("found!" ,width/2,height/2);
  }

  // ステージ内でPlayerとEnemyの接触判定
  // Gameoverの表示
  if (stg.crash()) {
    textSize(32);
    fill(255, 255, 255, 200);
    rect(0, 0, width, height);
    fill(255, 0, 0);        
    text("GAMEOVER", 100, 100);

    noLoop();
  }

  // ゴールの判定後の表示
  if (stg.goal()) {
    textSize(32);
    textAlign(LEFT,CENTER);
    fill(255, 255, 255, 200);
    rect(0, 0, width, height);
    fill(255, 0, 0);        
    text("GOAL!!", 100, 100);
    text("TIME : " + (millis() - PLAY_TIME) + " [ms]", 100, 150);

    noLoop();
  }
}

void keyPressed() {
  keys.set(keyCode, true);
}

void keyReleased() {
  keys.set(keyCode, false);
}
