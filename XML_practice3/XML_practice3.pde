//XML xml = loadXML("https://www.data.jma.go.jp/developer/xml/feed/regular_l.xml");

//XML[] entries = xml.getChildren("entry");
//for(XML entry : entries){
//  String content = entry.getChild("content").getContent();
//  if(content.indexOf("東京都")!=-1){
//    println(content);
//    println(entry.getChild("id").getContent()) ;
//  }
//}

XML xml = loadXML("https://www.data.jma.go.jp/developer/xml/data/20221121074057_0_VPFW50_130000.xml");
XML info = xml.getChild("Body").getChild("MeteorologicalInfos").getChild("TimeSeriesInfo");
XML[] times = info.getChild("TimeDefines").getChildren("TimeDefine");
XML[] predicts = info.getChild("Item")
.getChild("Kind")
.getChild("Property")
.getChild("WeatherPart")
.getChildren("jmx_eb:Weather");

for(int i=0;i < times.length; i++){
  String date = times[i].getChild("DateTime").getContent();
  date = split(date,"T")[0];
  println(date);
  println(predicts[i].getContent());
}
