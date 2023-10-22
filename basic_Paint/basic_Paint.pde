//basic_Paint
//make painting software with class
//2022/10/24
//1-4-45 Taiyu Honma

ArrayList<UIObject> objects = new ArrayList<UIObject>();

void setup(){
  size(600,600);
  frameRate(60);
  background(200);
  Canvas canvas1 = new Canvas(50,50, 200,400, color(255));
  canvas1.regist();
  Canvas canvas2 = new Canvas(300,50, 200,400, color(255));
  canvas2.regist();
  Canvas[] canvass = new Canvas[2];
  canvass[0] = canvas1;
  canvass[1] = canvas2;
  new Button("Red", 50, height-100, 80, 80)
  .setAction(new ChangeColor(canvass,0))
  .regist();
  new Button("Green", 130, height-100, 80, 80)
  .setAction(new ChangeColor(canvass,1))
  .regist();
  new Button("Blue", 210, height-100, 80, 80)
  .setAction(new ChangeColor(canvass,2))
  .regist();
  new CountButton("Stroke\nWeight", 290, height-100, 80, 90)
  .setAction(new ChangeWeight(canvass))
  .regist();
  new Button("Clear", 370, height-100, 80, 80)
  .setAction(new Clear(canvass))
  .regist();
  

}

void draw() {
  for(UIObject obj : objects){
    obj.display();
  }
}

void mousePressed(){
   for(UIObject obj : objects){
     if(obj instanceof  Button) {
       ((Button)obj).press(mouseX, mouseY);
     }
  }
}
class ChangeColor extends Action{
  Canvas[] canvass;
  int targetColor;
  ChangeColor(Canvas[] _canvas, int _targetColor) {
    canvass = _canvas;
    targetColor = _targetColor;
  }
  void action(boolean state) {
    for(Canvas canvas : canvass) {
      canvas.colors[targetColor] = state? 255 : 0;
    }
  }
}
class ChangeWeight extends Action{
  Canvas[] canvass;
  int targetColor;
  ChangeWeight(Canvas[] _canvas) {
    canvass = _canvas;
  }
  void action(boolean state) {
    ((CountButton)button).i += 1;
    if(((CountButton)button).i > 4) {
     ((CountButton)button).i = 1;
    }
    for(Canvas canvas : canvass) {
      canvas.weight = ((CountButton)button).i;
    }
    button.state = ((CountButton)button).i > 1;
  }
}
class Clear extends Action{
  Canvas[] canvass;
  Clear(Canvas[] _canvas) {
    canvass = _canvas;
  }
  void action(boolean state) {
    for(Canvas canvas : canvass) {
      canvas.clear();
    }
    button.reset();
  }
}
