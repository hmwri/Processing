class VerticalTimer extends TimerCore {
  //ProgressTimer(){}
  int r = 80;
  VerticalTimer(int _x, int _y)
  {
    // 親クラスのコンストラクタを呼び出す方法
    super(_x, _y);
  }

  void display()
  {
    
    int timeLeft = getTimeLeft();
    if(timeLeft >= 0)
    {
      fill(20,30,255);
      rect(x, y, 50, 120);
      fill(0, 0, 0);
      rect(x, y, 50, 120 - timeLeft*2);
    }
  }

  void click(int _mx, int _my){
     if(x <= _mx && _mx <= x+50 && y <= _my && _my <= y+120){
      iStartMillisecond = millis();
    }
  }
}
