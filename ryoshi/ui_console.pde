class ui_console extends ui_component {
  int bh = 0;
  ui_text text;
  ui_console(int buttonh){
    super(new ui_rect(0,buttonh,width/2,height-ui.headerh-buttonh));
    bh = buttonh;
    ui_text_config conf = new ui_text_config(20,color(255),LEFT);
    text = new ui_text("",new ui_rect(0,0,width/2,height-ui.headerh-bh),conf);
    addChild(text);
  }
  void set(String str){
    text.text = str;
  }
}
