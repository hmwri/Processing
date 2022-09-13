class ui_console extends ui_component {
  int bh = 0;
  ui_text text;
  String preLog = "";
  ui_console(int  buttonh) {
    super(new ui_rect(0, buttonh, width/2, height-ui.headerh-buttonh));
    bh = buttonh;
    ui_text_config conf = new ui_text_config(15, color(255), LEFT, BOTTOM);
    ui_box box = new ui_box(new ui_rect(0, 0, width/2, height-ui.headerh-bh), color(0));
    text = new ui_text("", new ui_rect(0, 10, width/2, height-ui.headerh-bh-10), conf);
    box.addChild(text);
    addChild(box);
  }
  void set(String str) {
    consoleText = str;
  }
  void add(String from, String str) {
    consoleText = consoleText + " " + from + ":" + str + "\n" ;
  }
  void draw() {
    if (!pythonFinished) {
      String[] logs = loadStrings("data/log.txt");
      String log = "";
      for (String str : logs) {
        if (!str.isEmpty()) {
          log+=(str+"\n");
        }
      }
      
      if (!preLog.equals(log)) {
        println(log);
        String result = diffFrontUnmatchStr(preLog, log);
        if (result!=null) {
          String[] results = result.split("\n");
          for(String str : results){
            consoleText = consoleText + " python:" + str + "\n" ;
          }
        }
        preLog = log;
      }
    }
    
    text.text = consoleText;
    super.draw();
  }
  public  String diffFrontUnmatchStr(String str1, String str2) {
    if(str1 !=null && str1.equals("")) {
      return str2;
    }
    StringBuffer buf = new StringBuffer();
    String result = null;
    if (str1 != null && str2 != null) {
      // 前方一致しない部分の文字列を取得
      String tmpStr1 = str1.trim();
      String tmpStr2 = str2.trim();
      boolean firstCharMachFlg = false;
      for (char str1Char : tmpStr1.toCharArray()) {
        buf.setLength(0);
        boolean unmachFlg = false;
        for (char str2Char : tmpStr2.toCharArray()) {
          // 不一致以降の文字列を全て設定
          if (unmachFlg || str1Char != str2Char) {
            buf.append(str2Char);
            unmachFlg = true;
          } else {
            firstCharMachFlg = true;
          }
        }
        // 判定した文字列は除外
        tmpStr2 = buf.toString();
      }

      if (!firstCharMachFlg || buf.toString().isEmpty()) {
        result = null;
      } else {
        result = buf.toString();
      }
    }
    return result;
  }
}
