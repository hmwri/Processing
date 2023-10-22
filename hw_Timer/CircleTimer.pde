class CircleTimer extends TimerCore {
  //ProgressTimer(){}
  int r = 80;
  CircleTimer(int _x, int _y)
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
      ellipse(x,y,r,r);
      fill(0, 255, 0);
      arc(x, y, r, r, 3*PI/2, 3*PI/2+PI/30*timeLeft );
    }
  }

  void click(int _mx, int _my){
    if(dist(_mx,_my,x,y) < r/2){
      iStartMillisecond = millis();
    }
  }
}
