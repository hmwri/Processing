class Operator {
  URL url = null;
  String encoding = "utf-8";
  Client client;
  Operator(hw_broeser a) {
  }
  void load(String ref) {
    encoding = "utf-8";
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
    if(client != null){
      client.stop();
    }
    String protocol = url.getProtocol();
    //client = new Client(this, host,protocol == "https" ? 443: 80);
  }
}
