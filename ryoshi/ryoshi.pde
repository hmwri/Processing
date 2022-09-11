ui_master ui;
void setup(){
  init();
  surface.setResizable( true );
  testLexer();
  size(1000,800);
  ui = new ui_master();
  
}

void init(){
  setupTokenNames();
  setupPriorities();
}


void draw(){
  background(0);
  ui.draw();
  
}

void testLexer(){
  String[] code = loadStrings("test.txt");
  String result = "";
  for (String str : code) {
    if(!str.isEmpty()){
      result+=(str+"\n");
    }
  }
  context c = new context(result);
  try{
  c.exe();
  }catch(Exception e) {
    println(e);
  }
}
