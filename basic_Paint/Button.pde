abstract class Action {
  Button button;

  abstract void action(boolean state);
}

class Button extends UIObject {
  String label;
  boolean state;
  Action action = null;
  Button(String _label, int _x, int _y, int _w, int _h) {
    super(_x, _y, _w, _h);
    label = _label;
    state = false;
  }

  void reset() {
    state = false;
  }
  
  void display() {
    textAlign(CENTER,CENTER);
    textSize(20);
    stroke(0);
    strokeWeight(1);
    fill(state ? color(255,200,200) : color(255));
    rect(x,y,w,h);
    fill(0);
    text(label, x+w/2, y+h/2);
  }
  
  Button setAction(Action _action) {
    _action.button = this;
    action = _action;
    return this;
  }
  
  boolean press(int mx, int my) {
    if(onMouse(mx,my)){
      state = !state;
      if(action != null) {
        action.action(state);
      }
      return true;
    }
    return false;
  }
}
