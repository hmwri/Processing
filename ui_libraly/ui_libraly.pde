void setup(){
  size(200,200);
  canvas.addUI(new button_en(50,50,60).addAction(new action1()));
}

class action1 implements Ui_Action{
  void Action(){
    println("Hi");
  }
}

void draw(){
  canvas.update();
}

void mousePressed(){
  canvas.inspectButton();
}



///以下UI
Canvas canvas = new Canvas();

interface Ui_Action{
  void Action();
}
class Canvas {
  ArrayList<Ui> _uis = new ArrayList<Ui>();
  void update(){
    for(Ui ui:_uis){
      ui.draw();
    }
  }
  void addUI(Ui ui){
    _uis.add(ui);
  }
  public ArrayList<Ui> getUi(){
    return _uis;
  }
  void inspectButton(){
      for(Ui ui : canvas.getUi()){
    if(ui instanceof button){
      button b = (button)ui;
      b.inspect();
    }
  }
  }
  Canvas(){
    
  }
}
abstract class Ui {
  void draw() {};
}
abstract class button extends Ui {
  ArrayList<Ui_Action> _actions = new ArrayList<Ui_Action>() ;
  void draw() {
  }
  void inspect(){
  }
  button addAction(Ui_Action a){
    _actions.add(a);
    return this;
  }
  void pushed(){
    for (Ui_Action a : _actions){
      a.Action();
    }
  }
}
class button_en extends button{
  int cx,cy,r;
  void inspect(){
    if(dist(cx,cy,mouseX,mouseY) < r/2){
      pushed();
    }
  }
  void draw() {
    ellipse(cx,cy,r,r);
  }
  button_en(int _cx,int _cy,int _r){
    cx = _cx; cy=_cy;r=_r;
  }
  
}
class button_box extends button{
  
}
