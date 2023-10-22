abstract class UIObject {
  int x, y;
  int w, h;
  

  UIObject(int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
  }
  void regist(){
    objects.add(this);
  }
  abstract void display() ;
  boolean onMouse(int mx, int my) {
    boolean check_x = x < mx && mx < x + w;
    boolean check_y = y < my && my < y + h;
    return check_x && check_y;
  }
}
