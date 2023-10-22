//hw_teachers
//make application that shows teacher information reading XML file
//Mac用にフォントを指定しています。windowsでは不要だと思いますので、12,13行のコメントアウトお願いします。
//2022/11/28
//1-4-45 Taiyu Honma
ArrayList<Teacher> ts = new ArrayList<Teacher>();
void setup(){
  XML xml = loadXML("fms_hw.xml");
  XML[] teachers = xml.getChild("teachers").getChildren("teacher");
  int y= 0;
  int h = 100;
  PFont font = createFont("",20);
  textFont(font);
  size(1000,800);
  for(XML teacher : teachers){
    ts.add(new Teacher(40,(h+10)*y+10,300,h,teacher));
    y++;
  }
}
void draw()
{
  background(200);
  for(Teacher t: ts){
    t.draw();
  }
}
