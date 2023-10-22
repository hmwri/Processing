class Operator {
  URL url = null;
  int scroll = 0;
  hw_ServerClientApp_Client parent;
  String encoding = "utf-8";
  Client client;
  Object preParsed;
  ArrayList<ClickListener> Clicklisteners = new ArrayList<ClickListener>();
  Operator(hw_ServerClientApp_Client _parent) {
    parent = _parent;
  }
  String reformURL(String ref) {

    try {
      URL rurl = new URL("https://google.com");
      if (url == null) {
        rurl = new URL(ref);
      }
      rurl = new URL(url, ref);
      return rurl.toString();
    }
    catch(Exception e) {
      println(e);
    }
    return "";
  }
  void request(String ref, String _encoding) {
    if (_encoding != null) {
      encoding = _encoding;
    }
    try {
      if (url == null) {

        url = new URL(ref);
      }
      url = new URL(url, ref);
    }
    catch(Exception e) {
      println(e);
    }
    String host = url.getHost();
    println("host:"+host);
    if (client != null) {
      client.stop();
    }
    String protocol = url.getProtocol();
    int port = url.getPort();
    if (port==-1) {
      port = protocol == "https" ? 443: 80;
    }
    client = new Client(parent, host, port);

    String path = url.getPath();
    String header = String.format("GET %s HTTP/1.1\nHost: %s\nAccept-Charset: utf-8\r\n\r\n'", path, host);
    println("request:"+header);
    client.write(header);
  }
  void load() {
    if (client.available() > 0) {
      byte[] dataIn = client.readBytes();
      String str = "";
      try {

        str = new String(dataIn, encoding);
      }
      catch(Exception e) {
        println("e"+e);
      }
      println("str:"+str);
      fill(200);
      rect(bwidth, 0, width-bwidth, 30);
      fill(0);
      textFont(styles.Bfont);
      textSize(25);
      textAlign(CENTER, CENTER);


      text("Response", bwidth, 0, width-bwidth, 30);
      fill(230);
      rect(bwidth, 30, width-bwidth, height-30);
      textAlign(LEFT, TOP);
      fill(50);
      textFont(styles.Mfont);
      textSize(15);
      text(str, bwidth + 10, 50, width-bwidth-10, height-50);
      Response r = new Response(str);
      //String test = "<html><head></head><body>こんにちはあいうえお<br><a href=''>こんにちはこんにちは</a></body></html>";
      HTMLParser p = new HTMLParser(r.body);
      Object parsed = p.Parse();
      preParsed = parsed;
      parsed.Print(0);
      Render render = new Render(parsed);
      render.rend(0);
    }
  }
  void reload() {
    println(url.toString());
    request(url.toString(), null);
  }

  void registCL(ClickListener _cl) {
    Clicklisteners.add(_cl);
  }

  void scroll(int y) {
    if (scroll+y < 0) {
      scroll+=y;
    }

    Render render = new Render(preParsed);
    render.rend(scroll);
  }
  void clicked(int mx, int my) {
    for (ClickListener cl : Clicklisteners) {
      cl.isClicked(mx, my);
    }
  }
  void stop() {
    client.stop();
  }
}

class ClickListener {
  void isClicked(int mx, int my) {
  }
}

class ClickListener1 extends ClickListener {
  Position p;
  int r;
  Action action;
  ClickListener1(Position _p, int _r, Action _action) {
    p = _p;
    r = _r;
    action = _action;
  }
  void isClicked(int mx, int my) {
    if (dist(mx, my, p.x, p.y) < r) {
      action.action();
    }
  }
}
class ClickListener2 extends ClickListener {
  Position p;
  Rect r;
  Action action;
  ClickListener2(Position _p, Rect _r, Action _action) {
    p = _p;
    r = _r;
    action = _action;
  }
  void isClicked(int mx, int my) {
    if (p.x < mx && p.x + r.w > mx&&p.y < my && p.y + r.h > my) {
      action.action();
    }
  }
}

interface Action {
  void action();
}
