class Render {
  Object root;
  String encoding = "UTF-8";
  Render(Object parsed) {
    root = parsed;
  }
  void rend() {
    rend(root);
  }
  void readHead(Tag headTag) {
    for (Object obj : headTag.Children) {
      Tag tag = (Tag)obj;
      switch(tag.name) {
      case "meta":
        for (Attribute attr : tag.attributes) {
          switch(attr.name) {
          case "content":
           String charset = extractInfo(attr.value).get("charset");
           if(charset != null && charset.equals("Shift_JIS")){
             println("here");
             encoding = "SHIFT-JIS";
           }
          }
        }
      case "title":
        if (tag.Children.size() >0 && tag.Children.get(0) != null && tag.Children.get(0) instanceof Text) {
          String title =  ((Text)(tag.Children.get(0))).body;
          encode(title);
          setPageTitle(title);
        }
      }
    }
  }
  void encode(String text){
    println("e;"+encoding);
    try {
      println(new String(text.getBytes("utf-8"),encoding));
    } catch (Exception e){
      println(e);
    }
    
  }
  void rend(Object obj) {

    if (obj instanceof Tag) {
      if (((Tag)obj).name.equals("head")) {
        readHead((Tag)obj);
        return;
      }
    }
    for (Object child : obj.Children) {
      rend(child);
    }
  }
  void setPageTitle(String title) {
    text(title, width/2, 0);
  }
  HashMap<String, String> extractInfo(String value) {
    HashMap<String, String> result = new HashMap<String, String>();
    String[] data = split(value, ';');
    for (String d : data) {
      
      String[] kandv = split(d, "=");
      String k = kandv.length >= 1 ? kandv[0].trim() : "";
      String v = kandv.length >= 2 ? kandv[1].trim() : "";
      println(k);
      result.put(k,v);
    }
    return result;
  }
}
