class CountButton extends Button {
  int i = 1;
  CountButton(String _label, int _x, int _y, int _w, int _h){
    super(_label,_x, _y, _w, _h);
  }
  void display() {
    String original = label;
    label = label + "\n"+i;
    super.display();
    label = original;
  }
}
