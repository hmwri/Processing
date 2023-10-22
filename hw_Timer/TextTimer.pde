class TextTimer extends TimerCore {

  TextTimer(int _x, int _y) {
    // 親クラスのコンストラクタを呼び出す方法
    super(_x, _y);
  }

  void display()
  {
    int timeLeft = getTimeLeft();
    textAlign(CENTER, CENTER);
    if (timeLeft >= 0) {
      textSize( 30 );
      fill( 0 );
      text( timeLeft, x, y );
    }
  }
  
  void click(int _mx, int _my){
    if(dist(x, y, _mx, _my) < 15){
      iStartMillisecond = millis();
    }
  }
}
