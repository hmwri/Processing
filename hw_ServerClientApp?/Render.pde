class Render {
  Object root;
  int titleh = 30;
  String title = "タイトルなし";
  PImage reloadImg = loadImage("reload.png");
  Render(Object parsed) {
    root = parsed;
  }
  void rend(int scroll) {
    fill(255);
    
    rect(0,titleh,bwidth,height);
    rend(root, null, new Position(0,scroll + titleh));
    fill(200);
    rect(0,0,bwidth,titleh);
    setPageTitle();
    fill(220);
    ellipse(bwidth-20,titleh+20,40,40);
    image(reloadImg,bwidth-35,titleh+5,30,30);
    ClickListener cl = 
    new ClickListener1(new Position(bwidth-20,titleh+20),20,new reloadAction());
    operator.registCL(cl);
    
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
            if (charset != null && charset.equals("Shift_JIS")) {
              String encoding = "SHIFT-JIS";
              if (!operator.encoding.equals(encoding)) {
                operator.request("", encoding);
              }
            }
          }
        }
      case "title":
        if (tag.Children.size() >0 && tag.Children.get(0) != null && tag.Children.get(0) instanceof Text) {
          String _title =  ((Text)(tag.Children.get(0))).body;
          title = _title;
        }
      }
    }
  }
  Element rend(Object obj, Element parent, Position offset) {
    boolean inline = false;
    Element elem = null;
    if (obj instanceof Tag) {
      Tag tag = (Tag)obj;
      if (tag.name.equals("head")) {
        readHead((Tag)obj);
        return null;
      }
      
      switch(tag.name) {
      case "html":
      case "root":
      case "div":
        elem = new DivElement(tag, parent, offset);
        break;
      case "br":
        elem = new BrElement(parent, offset);
        break;
      case "b":
        inline =true;
        elem = new BElement(parent, offset);
        break;
      case "a":
      inline = true;
        elem = new AElement(tag,parent, offset);
        break;
      case "body":
        elem = new BodyElement(parent, offset);
        break;
      case "h1":
        elem = new HElement(parent, offset, 1);
        break;
      case "h2":
        elem = new HElement(parent, offset,
          2);
        break;
      case "font":
        
        elem = new FontElement(tag,parent, offset);
        break;
            case "img":
        
        elem = new ImgElement(tag,parent, offset);
        break;
      }
    } else {
      elem = new TextElement((Text)obj, parent, offset);
    }
    if (elem != null) {
      elem.draw();
    }
    Position child_offset = new Position();
    for (Object child : obj.Children) {
      Element rendered = rend(child, elem, child_offset);
      
    }
    
    if (elem != null) {
      if(inline == true){
        elem.offset.add(child_offset);
      }
      elem.end();
    }


    return elem;
  }
  void setPageTitle() {
    textSize(titleh-10);
    textAlign(CENTER,CENTER);
    fill(0);
    text(operator.url+"   "+title,0, 0, bwidth, titleh);
  }
  HashMap<String, String> extractInfo(String value) {
    HashMap<String, String> result = new HashMap<String, String>();
    String[] data = split(value, ';');
    for (String d : data) {
      String[] kandv = split(d, "=");
      String k = kandv.length >= 1 ? kandv[0].trim() : "";
      String v = kandv.length >= 2 ? kandv[1].trim() : "";
      println(k);
      result.put(k, v);
    }
    return result;
  }
}
