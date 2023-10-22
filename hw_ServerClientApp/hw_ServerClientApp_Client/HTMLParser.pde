char EOF = '\0';

class HTMLParser {
  String html;
  int now = -1;
  HTMLParser(String _html) {
    html = _html;
  }
  char next() {
    if (now < html.length() - 1) {
      return html.charAt(now + 1);
    }
    return EOF;
  }
  char next(int index) {
    if (now < html.length() - index) {
      return html.charAt(now + index);
    }
    return EOF;
  }
  char now() {
    if (now < html.length()) {
      return html.charAt(now);
    }
    return EOF;
  }
  char read() {
    now++;
    return now();
  }
  Object Parse() {
    Tag root = new Tag("root");
    return parseBlock(root);
  }
  Object parseBlock(Tag parentObject) {
    while (next() != EOF) {
      switch(read()) {
      case '<':
        skip();
        if (next() == '/') {
          read();
          String name = parsekeyword();
          if (next() != '>') {
            println("構文エラー");
          };
          read();
          return parentObject;
        } else {
          Tag tag = parseTag();
          if (tag == null) {
            break;
          }
          if (isMustClosed(tag.name)) {
            tag.parentObject = parentObject;
            parentObject.Children.add(parseBlock(tag));
          } else {
            tag.parentObject = parentObject;
            parentObject.Children.add(tag);
          }
        }
        break;
      default:
        if (!isSpace2(now())) {
          Text text = parseText();
          parentObject.Children.add(text);
        }
      }
    }
    return parentObject;
  }
  Tag parseTag() {

    String name = parsekeyword();
    if (name.equals("!--")) {
      skipComment();
      return null;
    }
    ArrayList<Attribute> attrs = new ArrayList<Attribute>();
    while (next() != '>') {
      attrs.add(parseAttribute());
    }
    read();
    return new Tag(name, attrs);
  }
  Attribute parseAttribute() {
    String name = parsekeyword();
    if (next() == '=') {
      read();
      if (isQuote(next())) {
        read();
        String value = parseStr();
        return new Attribute(name, value);
      }
      String value = parsekeyword();
      return new Attribute(name, value);
    } else {
      return new Attribute(name, null);
    }
  }
  String parseStr() {
    skip();
    String word = "";
    while (next() != EOF && !isQuote(next())) {
      word += read();
    }
    if (isQuote(next())) {
      read();
    }
    skip();
    return word;
  }
  Text parseText() {
    String word = ""+now();
    while (next() != EOF && next() != '<') {
      char w = read();
      if(w != '\n' && w != '\t'){
      word += w;
      }
    }

    return new Text(word);
  }
  String parsekeyword() {
    skip();
    String word = "";
    while (next() != EOF && !isKigo(next())) {
      word += read();
    }
    skip();
    return word;
  }
  void skip() {
    while (next() != EOF && isSpace(next())) {
      read();
    }
  }
  void skipComment() {
    while (next() != EOF && !(next()=='-' && next(2)=='-' && next(3)=='>')) {
      read();
    }
    read();
    read();
    read();
  }
  boolean isQuote(char c) {
    return (c == '"' || c == '\'');
  }
  boolean isSpace(char c) {
    char[] space = new char[]{' ', '\t', '\n', '\r'};
    for (char s : space) {
      if (s == c) {
        return true;
      }
    }
    return false;
  }
    boolean isSpace2(char c) {
    char[] space = new char[]{ '\t', '\n', '\r'};
    for (char s : space) {
      if (s == c) {
        return true;
      }
    }
    return false;
  }
  boolean isKigo(char c) {
    char[] space = new char[]{' ', '=', '>'};
    for (char s : space) {
      if (s == c) {
        return true;
      }
    }
    return false;
  }
  boolean isMustClosed(String name) {
    String[] notMusts = new String[]{"br", "hr", "img", "input", "meta", "area", "base", "col", "embed", "keygen", "link", "param", "source"};
    for (String t : notMusts) {
      if (name.equals(t)) {
        return false;
      }
    }
    return true;
  }
}
