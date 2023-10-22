XML xml = loadXML("http://nkmr.io/lecture/2015/fms_syllabus.xml");
XML[] subjects = xml.getChildren("subject");

for(XML sub : subjects){
  println(sub.getChild("name").getContent());
}
for(XML sub : subjects){
  XML[] teachers = sub.getChild("teachers").getChildren("teacher");
  for(XML teacher: teachers){
    println(teacher.getContent());
  }
  
}
