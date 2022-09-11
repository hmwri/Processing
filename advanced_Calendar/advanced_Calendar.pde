//advanced_Calendar
//draw calendar
//2022/05/30
//1-4-45 Taiyu Honma
void setup(){
    println(year+"年"+month+"月");
  showCalendar(year,month);
  size(400,400);
  background(255);
  canvas.addUI(new button_en(350,50,60,"+").addAction(new operate("year",1)));
  canvas.addUI(new button_en(50,50,60,"-").addAction(new operate("year",-1)));

  canvas.addUI(new button_en(350,150,60,"+").addAction(new operate("month",1)));
  canvas.addUI(new button_en(50,150,60,"-").addAction(new operate("month",-1)));

}
int year = 2022;
int month = 7;

int getNumberOfDays(int year,int month){
  switch(month) {
    case 2:
      if((year%4==0 && year%100 !=0) || year%400 == 0){
        return 29;
      }
      return 28;
    case 4:
    case 6:
    case 9:
    case 11:
      return 30;
    default:
      return 31;
  }
}

int calcYobi(int year,int month,int day) {
  int y = month <= 2 ?  year - 1: year;
  int m = month<=2 ? month+12 : month;
  int Y = y % 100;
  int C= floor(float(y)/100.0);
  //これ、絶対0にならなくないですか？
  int h = (day+floor(float(26*(m+1))/10.0)+Y+floor(float(Y)/4.0)+5*C+floor(float(C)/4.0)+5)%7 + 1;
  h = h%7;
  return h;
}
void showCalendar(int year,int month) {
  for(int y=-calcYobi(year,month,1),i=y;i<getNumberOfDays(year,month)+1;print(i==y?" Sun Mon Tue Wed Thu Fri Sat\n":"  "+(i<1?"  ":(i<10?" ":"")+i+((i-y)%7==0?"\n":""))),i++);
}


//以下画面表示

void draw(){
  background(255);
  canvas.update();
  fill(0);
  textAlign(CENTER,CENTER);
  textSize(40);
  text(year,200,50);
  fill(0);
  textAlign(CENTER,CENTER);
  textSize(40);
  text(month,200,150);
}

void mousePressed(){
  canvas.inspectButton();
}

class operate implements Ui_Action{
  String target = "";
  int diff = 0;
  operate(String _target,int _diff){
    target = _target;
    diff = _diff;
  }
  void Action(){
    
    if(target == "year") {

      year += diff;
    }else{
      if(month+diff == 0){
        year--;
        month=12;
      }else if(month+diff == 13){
        year++;
        month = 1;
      }else{
        
      month += diff;
      }
    }
    
    println();
    println(year+"年"+month+"月");
    showCalendar(year,month);
  }
}

///以下自作UIライブラリ
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
  String text = "";
  void inspect(){
    if(dist(cx,cy,mouseX,mouseY) < r/2){
      pushed();
    }
  }
  void draw() {
    fill(255);
    
    ellipse(cx,cy,r,r);
    fill(0);
    textSize(40);
    textAlign(CENTER,CENTER);
    text(text,cx,cy-5);
  }
  button_en(int _cx,int _cy,int _r){
    cx = _cx; cy=_cy;r=_r;
  }
  button_en(int _cx,int _cy,int _r,String _text){
    cx = _cx; cy=_cy;r=_r;
    text = _text;
  }
}
