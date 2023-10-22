//basic_weather
//get weather info using API
//2022/11/28
//1-4-45 Taiyu Honma


//XML xml = loadXML("https://www.data.jma.go.jp/developer/xml/feed/regular_l.xml");

//XML[] entries = xml.getChildren("entry");
//for(XML entry : entries){
//  String content = entry.getChild("content").getContent();
//  if(content.indexOf("東京都")!=-1){
//    println(content);
//    println(entry.getChild("id").getContent()) ;
//  }
//}

XML xml = loadXML("tokyo_weather_1128.xml");
XML[] metros = xml.getChild("Body").getChildren("MeteorologicalInfos");
XML info1 = metros[0].getChild("TimeSeriesInfo");
XML info2 = metros[1].getChild("TimeSeriesInfo");
XML[] times = info1.getChild("TimeDefines").getChildren("TimeDefine");
XML[] kinds = info1.getChild("Item").getChildren("Kind");
XML[] properties = info2.getChild("Item").getChild("Kind").getChildren("Property");

XML[] tenkis = kinds[0].getChild("Property")
.getChild("WeatherPart")
.getChildren("jmx_eb:Weather");

XML[] kosuis = kinds[1].getChild("Property")
.getChild("ProbabilityOfPrecipitationPart")
.getChildren("jmx_eb:ProbabilityOfPrecipitation");

XML[] saiteis = properties[0]
.getChild("TemperaturePart")
.getChildren("jmx_eb:Temperature");

XML[] saikous = properties[3]
.getChild("TemperaturePart")
.getChildren("jmx_eb:Temperature");


for(int i=0;i < times.length; i++){
  String date = times[i].getChild("DateTime").getContent();
  date = split(date,"T")[0];
  println("======");
  println(date);
  println("天気:"+tenkis[i].getContent());
  String kosui = kosuis[i].getString("description");
  String saikou = saikous[i].getString("description");
  String saitei = saiteis[i].getString("description");
  println("降水確率:"+ (kosui == null ? "値なし" : kosui));
  println("最高気温:"+ (saikou == null ? "値なし" : saikou));
  println("最低気温:"+ (saitei == null ? "値なし" : saitei));
  println("======");
  
}
