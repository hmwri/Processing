//hw_OthelloSave
//save othelo log
//2022/11/14
//1-4-45 Taiyu Honma

int[][] masume = new int[8][8];
//　黒1,白2
int turn = 1;
void setup()
{
  String[] turn_lines = loadStrings("turn.txt");
  turn = int(turn_lines[0]);
  masume[3][3] = 2;
  masume[4][4] = 2;
  masume[4][3] = 1;
  masume[3][4] = 1;
  size(800, 800);
  String[] lines = loadStrings("status.txt");
  for (int y=0; y<8 && lines != null; y++) {
    String[] data = split(lines[y], ",");
    int x = 0;
    for (String d : data) {
      masume[x][y] = int(d);
      x++;
    }
  }

}

void draw() {
  for (int y=0; y < 8; y++) {
    for (int x=0; x< 8; x++) {
      fill(80, 225, 80);
      rect(x * 100, y*100, 100, 100);
      if (masume[y][x] == 0) continue;
      fill((masume[y][x] -1) * 255);
      ellipse(x*100 + 50, y*100 + 50, 80, 80);
    }
  }
}
void mousePressed() {
  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      if (aida(mouseX, 100*j, 100*(j+1)) && aida(mouseY, 100*i, 100*(i+1))  ) {
        if (masume[i][j]  == 0) {
          masume[i][j]  = turn;
          hantei(i, j);
          turn = turn == 1 ? 2 : 1;
          break;
        };
        masume[i][j] = masume[i][j] == 1 ? 2:1;
      }
    }
  }
  String[] saveLines = new String[8];
  for (int y=0; y<8; y++) {
    saveLines[y] = "";
    for (int x=0; x<8; x++) {
      saveLines[y] += (str(masume[x][y]) + (x == 7 ? "" : ","));
    }
  }
  saveStrings("status.txt", saveLines);
  String[] saveLines_turn = new String[1];
  saveLines_turn[0] = str(turn);
  saveStrings("turn.txt", saveLines_turn);
}
boolean aida(int n, int min, int max) {
  return min < n && n < max;
}

//反転するかどうか判定し、もしあれば反転させる関数
void hantei(int i, int j) {
  for (int dx = -1; dx <= 1; dx++) {
    for (int dy = -1; dy <= 1; dy++) {
      hanten(inspect(turn, j, i, dx, dy, 0), j, i, dx, dy);
    }
  }
}

//指定方向に指定個反転させる
void hanten(int n, int sx, int sy, int dx, int dy) {
  for (int i=1; i<=n; i++) {
    masume[sy+dy*i][sx+dx*i] = masume[sy+dy*i][sx+dx*i] == 1 ? 2:1;
  }
}

//指定方向に何個反転させるべき石があるか数える関数(再帰)
int inspect(int iro, int x, int y, int dx, int dy, int n) {
  if (!(aida(x+dx, -1, 8)&&aida(y+dy, -1, 8))) {
    return 0;
  }
  if (masume[y+dy][x+dx] == iro) {
    return n;
  }
  if (masume[y+dy][x+dx] == 0) {
    return 0;
  }
  return inspect(iro, x+dx, y+dy, dx, dy, n+1);
}
