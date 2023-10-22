class Teacher {
  int x, y, w, h;
  String name;
  String major;
  String room;
  String[] lectures;

  Teacher(int  _x, int _y, int _w, int _h, XML teacher
    ) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    name = teacher.getChild("name").getContent();
    major = teacher.getChild("major").getContent();
    room = teacher.getChild("room").getContent();
    XML[] lectures_xml = teacher.getChild("lectures").getChildren("lecture");
    lectures = new String[lectures_xml.length];
    int i= 0;
    for (XML lecture : lectures_xml) {
      lectures[i] = lecture.getContent();
      i++;
    }
  }

  void draw() {
    fill(255);
    rect(x, y, w, h);
    fill(0);
    textSize(20);
    textAlign(LEFT, TOP);
    text(name, x+10, y+10);
    textSize(16);
    text(major, x+30, y+45);
    text(room, x+30, y+65);
    if (x < mouseX && mouseX < x+w && y < mouseY && mouseY < y+h) {
      int i=0;
      for(String l: lectures){
        text(l, x+w+20, y+i*30);
        i++;
      }
    }
  }
}
