
class Response {
  String body = "";
  Response(String res){
    int border=0;
    for (int i=0;i<res.length();i++){
      border++;
      if(res.charAt(i) == '\n' && res.charAt(i+1) == '\r' && res.charAt(i+2) == '\n'){
        border+=2;
        break;
      };
    }
    println(border);
    for(int i = border; i < res.length() ; i++){
      body += res.charAt(i);
    }
  }
}
