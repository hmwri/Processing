//hw_FittsLaw
//dump csv file of fitts law
//2022/11/14
//1-4-45 Taiyu Honma

// 初期設定（ターゲットの最小値，最大値と，何回やるか？）
int targetMaxSize = 200;
int targetMinSize = 10;
int numberOfTask = 50;
// 画面の外に円がいかないようにマージンを設定
int margin = targetMaxSize / 2;

// 初期設定
int taskCount = 0;

// ターゲットの情報を格納する変数と，差分を求める変数
int targetW = targetMaxSize;
int targetX, targetY;
int lastX, lastY;
int lastMillis;
float[] log_ID = new float[numberOfTask];
float[] log_T = new float[numberOfTask];

void setup() {
  // もろもろの設定
  size(800, 800);
  textSize(64);
  textAlign(CENTER);
  fill(0);

  // 最初は真ん中に配置
  targetX = width / 2;
  targetY = height /2;
}

void draw() {
  background(255);

  // タスク上限に達していなかったら円を，達したらFinishと表示せよ
  if (taskCount < numberOfTask) {
    ellipse(targetX, targetY, targetW, targetW);
  } else {
    text("Finish!", width/2, height/2);
  }
}

void mousePressed() {
  // ターゲットの内部をクリックした？（targetWは直径のため0.5倍）
  if (dist(mouseX, mouseY, targetX, targetY) <= targetW * 0.5) {
    // taskCountが1以上だったらタスク実施中
    if (taskCount > 0) {
      // Tは前回と今回との時間の差分
      float T = millis() - lastMillis;
      // Dは前回のクリック位置とターゲットの中心座標の距離
      float D = dist(lastX, lastY, targetX, targetY);
      // Wはターゲットの直径
      float W = targetW;

      // IDはどういう式で求まるだろうか？
      float ID = log(D/W+1.0)/log(2);
      log_ID[taskCount-1] = ID;
      log_T[taskCount-1] = T;
      String[] saveLines = new String[taskCount];
      for(int y=0; y<saveLines.length; y++) {
        saveLines[y] = log_ID[y] + "," + log_T[y];
      }
      saveStrings("results.csv", saveLines);
    }
    taskCount++;

    // 次の大きさを決めるよ！
    targetW = (int)random(targetMinSize, targetMaxSize);
    targetX = (int)random(margin, width-margin);
    targetY = (int)random(margin, height-margin);

    // 移動距離と時間を差分から求めるために前回の値を記録しておく
    lastX = mouseX;
    lastY = mouseY;
    lastMillis = millis();
  }
}
