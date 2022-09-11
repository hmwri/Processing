class ui_right extends ui_component {
  int w = width/2;
  int buttonh = 25;
  boolean console = true;
  ui_box resultBox;
  ui_box consoleBox;
  ui_text resultText;
  ui_text consoleText;
  ui_result result;
  ui_console consoleui;
  ui_right(int h) {
    super(new ui_rect(width/2, h, width/2, height-h));
    resultBox = new ui_box(new ui_rect(0, 0, w/2, buttonh), color(200));
    consoleBox = new ui_box(new ui_rect(w/2, 0, w/2, buttonh), color(200));
    ui_text_config buttonConfig = new ui_text_config(20, color(255), CENTER);
    resultText = new ui_text("result", new ui_rect(0, 0, w/2, buttonh), buttonConfig);
    consoleText = new ui_text("console", new ui_rect(0, 0, w/2, buttonh), buttonConfig);
    resultBox.addChild(resultText);
    consoleBox.addChild(consoleText);
    ui_action displayResult = new changeDisplay(false);
    ui_action displayConsole = new changeDisplay(true);
    resultBox.addButtonFunc(displayResult);
    consoleBox.addButtonFunc(displayConsole);
    this.addChild(resultBox);
    this.addChild(consoleBox);
    result = new ui_result(buttonh);
    this.addChild(result);
    consoleui = new ui_console(buttonh);
    this.addChild(consoleui);
  }
  void draw() {
    color on = color(255);
    color off = color(0);
    if (console) {
      result.setActive(false);
      consoleBox.c = on;
      resultBox.c = off;
    } else {
      result.setActive(true);
      consoleBox.c = off;
      resultBox.c = on;
    }

    super.draw();
  }
}

class changeDisplay implements ui_action {
  boolean console = false;
  changeDisplay(boolean con) {
    console = con;
  }
  void action() {
    println(console);
    ui.right.console = console;
  }
}
