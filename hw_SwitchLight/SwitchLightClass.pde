class SwitchLight {
  boolean on;
  button onButton;
  button offButton;
  int x;
  int y;
  SwitchLight(boolean _on,int _x, int _y) {
    on = _on;
    x = _x;
    y = _y;
    onButton = new button(x-20,y+20,true);
    offButton = new button(x+20,y+20,false);
  }
  void draw(){
    fill(255);
    rect(x-10,y-50,20,80);
    
    rect(x-50,y-20,100,60);
    onButton.draw(on);
    offButton.draw(on);
    fill(on ? color(255,255,0) : color(100));
    ellipse(x,y-50,40,40);
    
  }
  void inspectClick(){
    if(onButton.isClicked()){
      on = true;
    }
     if(offButton.isClicked()){
          on = false;
    }
  }
}

class button {
  int x;
  int y;
  boolean on;
  
  int r = 15;
  button(int _x,int _y,boolean _on){
    x = _x;
    y= _y;
    on = _on;
  }
  boolean isClicked() {
    if(dist(mouseX,mouseY,x,y)<r){
      return true;
    }
    return false;
  }
  void draw(boolean _on){
    fill(0);
    textAlign(CENTER,CENTER);
    text(on ? "ON" : "OFF",x,y-30);
    if(on == _on){
      if(_on) {
        fill(color(255,0,0));
      }else{
        fill(color(0,0,100));
      }
    }else{
       fill(color(100));
    }
    ellipse(x,y,r*2,r*2);
  }
}
