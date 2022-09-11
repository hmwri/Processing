class ui_result extends ui_component {
  ui_result(int buttonh){
    super(new ui_rect(0,buttonh,width/2,height-ui.headerh-buttonh));
  }
  void set(result result){
    int i = 0;
    this.children = new ArrayList<ui_component>();
    for(result_bit bit :result.result){
      addChild(new ui_result_row(bit.name,float(bit.value)/float(result.shots)*100.0,i*20));
      i++;
    }
  }
}

class ui_result_row extends ui_component {
  String name ;
  float value;
  int h;
  ui_result_row(String _name,float _value,int sy){
    super(new ui_rect(0,sy,width/2,0));
    h = 20;
    rect.h = h;
    name = _name;
    value = _value;
    ui_text_config conf = new ui_text_config(20,color(255),LEFT);
    ui_text nameText = new ui_text(name,new ui_rect(0,0,width,30),conf);
    ui_text valueText = new ui_text(String.format("%.2f",float(round(value*100))/100.0),new ui_rect(width/4,0,width,30),conf);
    addChild(nameText);
    addChild(valueText);
  }
}
