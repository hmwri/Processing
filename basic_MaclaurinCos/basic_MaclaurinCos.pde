//basic_MaclaurinCos
//calc maclaurin
//2022/06/27
//1-4-45 Taiyu Honma
void setup() {
  // 縦横600x400のウインドウを作成する
  size( 600, 400 );
  textSize( 30 );
  // 1秒に1回更新とする
  frameRate(1);
}

// 累乗の計算をして返す
float calcPower(float number, int n){
  float result = 1;
  for(int i=0;i<n;i++){
    result *= number;
  }
  return result;
}

// 階乗の計算をして返す
int calcFactorial( int num ){
  // ここを完成させる
  return calcFactorial(num,1);
}

float f( float x, int n ){
  return calcPower(-1,n)*calcPower(x,n*2)/calcFactorial(n*2);
}

float Maclaurin( float x, int n ) {
  float retVal = 1;
  for ( int i=1; i<=n; i++ ) {
    retVal += f(x,i);
  }
  return retVal;
}

int number = 0;
void draw() {
  // 背景を白色で塗りつぶす
  background( 255 );
  // 線の太さは適当に３とする
  strokeWeight(3);
  // 軸を描く
  stroke( 0 );
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
  
  fill( 0 );
  text( "n = " + number, 100, 50 );

  // -4PIから初めて4PIくらいまで描画してみる
  float x = -2*PI;
  while ( x < 2*PI ) {
    // (x*50, y*100)の所にsinxの値を描画してみる
    float y1 = cos(x);
    stroke(0, 0, 255);
    point( x*50 + width/2, height/2-y1*100 );

    // (x*50, y*100)の所にsinxの近似の値を描画してみる
    // numberはどの項まで対象とするかということ
    float y2 = Maclaurin(x, number);
    stroke( 255, 0, 0 );
    point( x*50 + width/2, height/2-y2*100 );

    // xの値を増やす
    x += 0.01;
  }

  // 7になったら0に戻そう！
  // intだと桁あふれしてしまうため
  number++;
  number %= 7;
}




int calcFactorial(int n,int r){
  r = r * n;
  if(n == 1){
    return r;
  }
  return calcFactorial(n-1,r);
}
