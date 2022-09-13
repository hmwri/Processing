class ui_result extends ui_component {
  ui_result(int buttonh){
    super(new ui_rect(0,buttonh,width/2,height-ui.headerh-buttonh));
  }
  void set(result result){
    int i = 0;
    this.children = new ArrayList<ui_component>();
    for(result_bit bit :result.result){
      addChild(new ui_result_row(bit.name,float(bit.value)/float(result.shots)*100.0,i));
      i++;
    }
  }
  void draw(){
    if(globalResult !=null && !globalResult.isDisplayed){
      set(globalResult);
      globalResult.isDisplayed = false;
    }
    super.draw();
  }
}

class ui_result_row extends ui_component {
  String name ;
  float value;
  int h;
  int i;
  ui_result_row(String _name,float _value,int i){
    super(new ui_rect(0,0,width/2,0));
    h = 25;
    rect.h = h;
    rect.y = i*h;
    this.i = i;
    name = _name;
    value = _value;
    ui_text_config conf = new ui_text_config((int)(h*0.75),color(255),LEFT,CENTER);
    float nameWidth = 0.8;
    ui_box graph = new ui_box(new ui_rect(0,0,width/2.0*value/100.0,h),color(#021F6C));
    ui_text nameText = new ui_text(name,new ui_rect(0,0,width/2.0*nameWidth,30),conf);
    ui_text valueText = new ui_text(String.format("%.2f",float(round(value*100))/100.0)+"%",new ui_rect(width/2.0*nameWidth,0,width/2.0*(1.0-nameWidth),30),conf);
    addChild(graph);
    addChild(nameText);
    addChild(valueText);
  }
  void draw(){
    this.background(i%2 == 0?color(#395171):color(#5578A7));
    super.draw();
  }
}
