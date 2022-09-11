import javax.swing.*;
import java.awt.*;
class ui_master {
  Canvas canvas = (Canvas)surface.getNative();
  JLayeredPane pane = (JLayeredPane) canvas.getParent().getParent();
  ui_editor editor;
  ui_header header;
  ArrayList<ui_component> uis = new ArrayList<ui_component>();
  ui_master() {
    editor = new ui_editor(this, new ui_rect(0, 50, width/2, height-50));
    String[] code = loadStrings("test.txt");
    editor.setText(code);
    uis.add(editor);
    header = new ui_header(100);
    uis.add(header);
  }

  void draw() {
    for(ui_component ui:uis){
      ui.draw();
    }
    editor.reSize(0,50,width/2, height-50);
  }
}
