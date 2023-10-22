class ProgressTimer extends TimerCore {
  //ProgressTimer(){}
  
  ProgressTimer(int _x, int _y)
  {
    // 親クラスのコンストラクタを呼び出す方法
    super(_x, _y);
  }

  void display()
  {
    int timeLeft = getTimeLeft();
    if(timeLeft >= 0)
    {
      fill(0);
      rect(x, y, 120, 50);
      fill(0, 255, 0);
      rect(x, y, timeLeft*2, 50);
    }
  }

  void click(int _mx, int _my){
    if(x <= _mx && _mx <= x+120 && y <= _my && _my <= y+50){
      iStartMillisecond = millis();
    }
  }
}
