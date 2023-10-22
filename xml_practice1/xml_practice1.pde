XML xml = loadXML("http://nkmr.io/lecture/2015/fms.xml");

XML[] children = xml.getChild("teachers").getChildren("teacher");

println(xml.getChild("name").getContent());
for(XML child: children){
  println(child.getChild("name").getContent());
  XML[] lectures = child.getChild("lectures").getChildren("lecture");
  for(XML lecture : lectures){
    println(lecture.getContent());
  }
}
