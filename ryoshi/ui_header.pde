class ui_header extends ui_component{
  Image logo ;
  ui_header(int h){
    super(new ui_rect(0,0,width,h));
    children.add(new ui_image("icon.png",new ui_rect(0,0,(int)(h*0.8),h)));
  }
}
