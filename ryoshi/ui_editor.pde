class ui_editor extends ui_component{
  JTextArea area = new JTextArea();
  JScrollPane pane;
  ui_master parentui;
  ui_editor(ui_master ui, ui_rect _rect) {
    super(_rect);
    parentui = ui;
    area.setLineWrap(true);
    area.setWrapStyleWord(true);
    JScrollPane scrollPane = new JScrollPane(area);
    scrollPane.setBounds(rect.x, rect.y, rect.x+rect.w, rect.y+rect.h);
    parentui.pane.add(scrollPane);
    pane = scrollPane;
  }
  void setText(String str) {
    area.setText(str);
  }
  void setText(String[] strs) {
    String result = "";
    for (String str : strs) {
      if (!str.isEmpty()) {
        result+=(str+"\n");
      }
    }
     area.setText(result);
  }
  void draw(){
  
  }
  void reSize(int x1, int y1, int x2, int y2){
    pane.setBounds(x1, y1, x2, y2);
  }
}
