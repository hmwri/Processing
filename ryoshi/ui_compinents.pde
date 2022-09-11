abstract class ui_object {
  boolean active = true;
  
}

abstract class ui_component  extends ui_object{
  ui_rect rect;
  ArrayList<ui_component> children = new ArrayList<ui_component>();
  ui_component(ui_rect _rect) {
    rect = _rect;
  }
  boolean isOnMouse(){
    if(aida(mouseX,rect.x,rect.x+rect.w)&&aida(mouseY,rect.y,rect.y+rect.h)){
      return true;
    }
    return false;
  }
  void draw(){
    if(!active) return;
    for(ui_component ui : children){
      ui.draw();
    }
  };
}
boolean aida(int x,int min,int max){
  if(min<x && x<max){
    return true;
  }
  return false;
}

class ui_image extends ui_component {
  String path;
  PImage img;
  ui_image(String _path,ui_rect _rect){
    super(_rect);
    path = _path;
    img = loadImage(_path);
  }
  void draw()
  {
    if(!active) return;
    image(img, rect.x,rect.y,rect.w,rect.h);
  }
}

class ui_text_config{
  color c;
  int fontsize;
  int align = CENTER;
  int valign = CENTER;
  ui_text_config(int _fontsize,color _c,int _align){
    fontsize = _fontsize;
    c = _c;
    align = _align;
  }
}

class ui_text extends ui_component {

  String text;
  ui_text_config conf;
  ui_text(String _text,ui_rect _rect,ui_text_config config){
    super(_rect);
    text =_text;
    conf = config;
    
  }
  void draw(){
    if(!active) return;
    textSize(conf.fontsize);
    fill(conf.c);
    textAlign(conf.align,conf.valign);
    text(text,rect.x,rect.y,rect.w,rect.h);
  }
}

class ui_rect {  
  int w;
  int h;
  int x;
  int y;
  ui_rect(int _x,int _y,int _w,int _h){
    w = _w;
    h = _h;
    x = _x;
    y = _y;
  }
}

class ui_box extends ui_component{
  color c;
  boolean border = false;
  color borderC;
  int borderW;
  ui_box(ui_rect _rect,color _c){
    super(_rect);
    c = _c;
  }
  ui_box(ui_rect _rect,color _c,color bc,int bw){
    super(_rect);
    c = _c;
    borderC = bc;
    borderW = bw;
  }
  void draw(){
    if(!active) return;
    if(border){
      stroke(borderC);
      strokeWeight(borderW);
    }else{
      noStroke();
    }
    fill(c);
    rect(rect.x,rect.y,rect.w,rect.h);
  }
}
interface ui_action {
  void action();
}
class button extends ui_object {
  ui_component target;
  ui_action action;
  button(ui_component _target,ui_action _action){
    target = _target;
    action = _action;
  }
  void pushed(){
    action.action();
  }
  boolean inspectPushed(){
    return target.isOnMouse();
  }
}
