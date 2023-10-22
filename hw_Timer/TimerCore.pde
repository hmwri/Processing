class TimerCore {
  int iStartMillisecond;
  int x;
  int y;
  
  TimerCore(int _x, int _y) 
  {
    x = _x;
    y = _y;    
    iStartMillisecond = -1;
  } 

  void display() 
  {
  }
  
  void click(int _mx, int _my)
  {
    iStartMillisecond = millis();
  }

  int getTimeLeft() 
  {
    if(iStartMillisecond >= 0){
      if ( 60-(millis()-iStartMillisecond)/1000 < 0 ) {
        return 0;
      }
      return 60-(millis()-iStartMillisecond)/1000;
    }
    return 60;
  }
}
