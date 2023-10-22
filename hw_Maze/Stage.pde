class Stage {
  int x, y; // ステージのグリッド数
  int cellsize = 5; // セルの大きさ
  int goal_x, goal_y; // ゴール位置（インデックス）

  // ステージの状態を管理する field 配列
  // 0: 通路 
  // 1: 壁
  // 2: スタート地点（色を変えた通路）
  // 3: ゴール地点（色を変えた通路）
  int[][] field;

  Player player; // ステージに登録するPlayerクラスのインスタンス
  ArrayList<Enemy> enemies; // ステージに登録する敵（複数いると想定してリストに）

  Stage(int _x, int _y, int _size) {
    x = _x;
    y = _y;
    cellsize = _size;
    field = new int[x][y]; 

    goal_x = x-2; // ゴールは右下のセルに設定
    goal_y = y-2;

    // 雑な迷路生成アルゴリズム
    makeMaze();

    // 左上をスタート地点
    this.field[1][1] = 2;
    // 右下をゴール地点
    this.field[goal_x][goal_y] = 3;
  }

  void setPlayer(Player _player) {
    this.player = _player;
  }

  void setEnemies(ArrayList<Enemy> _enemies) {
    this.enemies = _enemies;
  }

  void makeMaze() {
    for (int i = 0; i < x; i++) {
      this.field[i][0] = 1;
      this.field[i][y-1] = 1;
    }
    for (int j = 0; j < y; j++) {
      this.field[0][j] = 1;
      this.field[x-1][j] = 1;
    }

    ArrayList<Integer> cand_list = new ArrayList<Integer>();

    for (int i = 2; i < x-1; i+=2) {
      for (int j = 2; j < y-1; j+=2) {
        cand_list.add(i + y * j);
      }
    }

    while (cand_list.size() > 0) {
      int n = (int)random(cand_list.size());   

      int cand =  cand_list.get(n);
      cand_list.remove(n);

      int cx = cand % x;
      int cy = cand / y;

      if (field[cx][cy] == 1) {
        continue;
      } else {
        field[cx][cy] = 1;

        while (true) {

          int ext_x = cx, ext_y = cy;
          int rand = (int)random(4);

          if (rand == 0) { 
            ext_x -= 2;
          }
          if (rand == 1) { 
            ext_y -= 2;
          }
          if (rand == 2) { 
            ext_x += 2;
          }
          if (rand == 3) { 
            ext_y += 2;
          }

          if (field[ext_x][ext_y] == 0) {
            // 壁じゃなかったら
            field[ext_x][ext_y] = 1;
            field[cx-(ext_x-cx)/2][cy-(ext_y-cy)/2] = 1;
            cx = ext_x;
            cy = ext_y;
          } else {
            // 壁だったら接続して終了
            field[cx-(ext_x-cx)/2][cy-(ext_y-cy)/2] = 1;
            break;
          }
        }
      }
    }
  }


  void display() {
    stroke(200);
    for (int i = 0; i < x; i++) {
      for (int j = 0; j < y; j++) {
        int tx = i * cellsize;
        int ty = j * cellsize;

        if (field[i][j] == 1) {
          fill(100);
        } else if (field[i][j] == 2) {
          fill(255, 200, 200);
        } else if (field[i][j] == 3) {
          fill(200, 255, 200);
        } else {
          fill(255);
        }

        rect(tx, ty, cellsize, cellsize);
      }
    }
  }

  // ステージに設定したPlayerとEnemyの接触判定
  // ぶつかっていたらTrueを返す
  boolean crash() {

    for (int i = 0; i < enemies.size(); i++) {
      Enemy e = enemies.get(i);
      if (e.collide(player.x, player.y) || 
        e.collide(player.x+player.size, player.y) || 
        e.collide(player.x, player.y+player.size) || 
        e.collide(player.x+player.size, player.y+player.size)) {
        return true;
      }
    }
    return false;
  }

  // ある座標を渡したときに，壁にぶつかっている（内部にある）か判定
  // ぶつかっていたらTrueを返す
  boolean collide(float ix, float iy) {
    if (ix < 0 || ix > x*cellsize || iy < 0 || iy > y*cellsize) {
      return true;
    }

    for (int i = 0; i < x; i++) {
      for (int j = 0; j < y; j++) {
        if (field[i][j] == 1) {
          int cx = i * cellsize;
          int cy = j * cellsize;

          if (ix <= cx+cellsize && ix >= cx && iy <= cy+cellsize && iy >= cy) {
            return true;
          }
        }
      }
    }

    return false;
  }

  // ゴールしているかどうか判定
  boolean goal() {
    int cx = goal_x * cellsize;
    int cy = goal_y * cellsize;

    if (player.x <= cx+cellsize && player.x >= cx && player.y <= cy+cellsize && player.y >= cy) {
      return true;
    }

    return false;
  }
  
  // ある数値を渡したときに，
  // ステージ上の何番目のセルに対応しているか返す（X座標）
  int position_X(float ix){
     return (int)(ix / cellsize);
  }

  // ある数値を渡したときに，
  // ステージ上の何番目のセルに対応しているか返す（Y座標）
  int position_Y(float iy){
     return (int)(iy / cellsize);
  }
  
}
