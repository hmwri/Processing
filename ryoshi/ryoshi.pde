ui_master ui;
void setup() {
  init();
  surface.setResizable( true );
  //testLexer();
  size(1000, 800);
  ui = new ui_master();
  ui.init();
  PFont font = loadFont("SourceHanCodeJP-Normal.vlw");
  textFont(font);
}

void init() {
  setupTokenNames();
  setupPriorities();
}


void draw() {
  background(#242F4B);
  ui.draw();
}

void testLexer() {
  String[] code = loadStrings("test.txt");
  String result = "";
  for (String str : code) {
    if (!str.isEmpty()) {
      result+=(str+"\n");
    }
  }
  context c = new context(result);
  try {
    c.exe();
  }
  catch(Exception e) {
    println(e);
  }
}
void exe() {
  context c = new context(ui.editor.getText());
  exe1 e = new exe1(c);
  e.start();
}

result readResult () {
  JSONObject jarray = loadJSONObject("result.json");
  int shots = jarray.getInt("shots");
  result result = new result(shots);
  JSONArray results = jarray.getJSONArray("result");
  for (int i=0; i<results.size(); i++) {
    String name = results.getJSONArray(i).getString(0);
    int value = results.getJSONArray(i).getInt(1);
    result.result.add(new result_bit(name, value));
  }
  return result;
}
class exe1 extends Thread {
  context ctx;
  exe1(context _ctx) {
    ctx = _ctx;
  }
  void run() {
    try {
      ctx.exe();
    }
    catch(Exception e) {
      ui.addConsole("compiler",e.getMessage());
    }
    globalResult = readResult();
  }
}
result globalResult = null;
String consoleText = "";
boolean pythonFinished = true;
class result {
  boolean isDisplayed = false;
  int shots;
  ArrayList<result_bit> result = new ArrayList<result_bit>();
  result (int s) {
    shots = s;
  }
}

class result_bit {
  String name;
  int value;
  result_bit(String _name, int _value) {
    name = _name;
    value = _value;
  }
}
