import java.awt.Color;

abstract class Element {
  Element parentObject = null;
  Position position = new Position();
  Position offset = new Position();
  Rect rect = new Rect(width, height);
  Position world_position = new Position(0, 0);
  Rect world_rect = new Rect(width, height);
  abstract void draw();
  void end() {
    styles = prestyles;
  };
  Styles prestyles = styles;
  Element(Element p, Position _offset) {
    offset = _offset;
    parentObject = p;
    if (parentObject != null) {
      world_rect = parentObject.world_rect.clone();
      float offset_x = 0;
      if (styles.align == CENTER) {
        offset_x = parentObject.world_rect.w/2.0;
      } else if (styles.align == RIGHT) {
        offset_x = parentObject.world_rect.w;
      }
      world_position = parentObject.world_position.clone();
      world_position.addx((int)offset_x);
    }
    world_position.add(_offset);
    try {
      prestyles = styles.clone();
    }
    catch(Exception e ) {
      println(e);
    }
  }
}




class TextElement extends Element {
  String body = "";
  TextElement(Text text, Element parent, Position _offset) {
    super(parent, _offset);

    this.body = text.body;
    this.offset.addx(int(styles.fontsize*body.length()*0.666));
    println(styles.fontsize);
    this.world_rect = new Rect(ceil(styles.fontsize*body.length()*0.67), styles.lineHeight);
  }
  void draw() {
    fill(styles.fontColor);

    textAlign(styles.align, CENTER);
    if (styles.bold) {
      textFont(styles.Bfont);
    } else {
      textFont(styles.Mfont);
    }
    textSize(styles.fontsize);

    text(body, world_position.x, world_position.y, world_rect.w, world_rect.h);
    if (styles.underLine) {
      line(world_position.x, world_position.y+ world_rect.h, world_position.x + world_rect.w, world_position.y + world_rect.h);
    }
    if (styles.link) {
      operator.registCL(new ClickListener2(world_position,world_rect,new hrefAction(styles.linkURL)));
    }
  }
}
class ImgElement extends Element {
  String url = "";
  int w = 200;
  int h = 200;
  ImgElement(Tag tag, Element parent, Position _offset) {
    super(parent, _offset);
    for (Attribute attr : tag.attributes) {
      switch(attr.name) {
      case "src":
        url  = attr.value;
        break;
      case "width":
        w  = int(attr.value);
        break;
      case "height":
        h  = int(attr.value);
      };
    }
    offset.addx(w);
    offset.addy(h);
    world_rect = new Rect(w,h);
  }
  void draw() {
    PImage img = loadImage(operator.reformURL(url));
    image(img, world_position.x, world_position.y, w,h);
  }
}
class FontElement extends Element {
  FontElement(Tag tag, Element parent, Position _offset) {
    super(parent, _offset);
    for (Attribute attr : tag.attributes) {
      switch(attr.name) {
      case "size":
        styles.setFontSize(int(attr.value)*4);
        break;
      case "color":
        styles.fontColor = color(Color.decode(attr.value).getRed(),
          Color.decode(attr.value).getGreen(),
          Color.decode(attr.value).getBlue());
      };
    }
  }
  void draw() {
  }
}
class BodyElement extends Element {
  BodyElement(Element parent, Position _offset) {
    super(parent, _offset);
    this.world_position.addx(10);
    this.world_position.addy(10);
  }
  void draw() {
  }
}

class BrElement extends Element {
  BrElement(Element parent, Position _offset) {
    super(parent, _offset);
    this.offset.x = 0;
    this.offset.addy(styles.lineHeight);
  }
  void draw() {
  }
}

class AElement extends Element {

  AElement(Tag tag, Element parent, Position _offset) {
    super(parent, _offset);
    styles.fontColor = color(10, 10, 200);
    styles.underLine = true;
    styles.link = true;
    for (Attribute attr : tag.attributes) {
      switch(attr.name) {
      case "href":
        styles.linkURL = attr.value;
      };
    }
  }
  void draw() {
  }
}

class BElement extends Element {
  BElement(Element parent, Position _offset) {
    super(parent, _offset);
    styles.bold = true;
  }
  void draw() {
  }
}

class HElement extends Element {
  HElement(Element parent, Position _offset, int i) {

    super(parent, _offset);

    switch(i) {
    case 1:
      styles.bold = true;
      styles.setFontSize(30, 30);
      offset.addy(styles.lineHeight);
      break;
    case 2:
      styles.bold = false;
      styles.setFontSize(20, 20);
      offset.addy(styles.lineHeight);
      break;
    }
  }
  void draw() {
  }
}


class DivElement extends Element {
  Tag divTag;
  DivElement(Tag tag, Element parent, Position _offset) {
    super(parent, _offset);
    divTag = tag;
    for (Attribute attr : tag.attributes) {
      switch(attr.name) {
      case "align":
        switch(attr.value) {
        case "center":
          styles.align = CENTER;
          break;
        case "left":
          styles.align = LEFT;
          break;
        case "right":
          styles.align = RIGHT;
          break;
        }
      }
    }
  }
  void draw() {
  }
}



class Position {
  int x = 0;
  int y = 0;
  Position() {
  }
  Position(int _x, int _y) {
    x = _x;
    y = _y;
  }
  void add(Position p) {
    x += p.x;
    y += p.y;
  }
  void addy(int _y) {
    y += _y;
  }
  void addx(int _x) {
    x += _x;
  }
  Position plus(Position p) {
    int _x = p.x + x;
    int _y = p.y + y;
    return new Position(_x, _y);
  }
  Position clone() {
    return new Position(x, y);
  }
}

class Rect {
  int w = 0;
  int h = 0;
  Rect() {
  }
  Rect(int _x, int _y) {
    w = _x;
    h = _y;
  }

  Rect clone() {
    return new Rect(w, h);
  }
}
