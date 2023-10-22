//hw_ServerClientApp(Server)
//ブラウザを作成しました。
//Macで作業しているため、Windowsで実行すると環境の差異によって動かなくなってしまうかもしれません。また、通信が不安定で
//たまにヌルポが発生してしまいますが、そのときは再起動お願いします。
//2022/11/28
//1-4-45 Taiyu Honma
import processing.net.*;
import java.nio.charset.StandardCharsets;
import java.net.URL;

Server myServer = new Server(this, 1234);

void setup() {
}

void stop() {
  myServer.stop();
}

void draw()
{
  Client nextClient = myServer.available();
  if (nextClient != null) {
    String request = nextClient.readString();
    String[] data = split(request, "\n");
    if (data.length> 0) {
      
      String[] requestInfo = split(data[0], " ");
      String type = requestInfo[0];
      String page = requestInfo[1];
      String head = getHead();
      switch(page) {
      case "":
      case "/":
        String html = getHTML("index.html");
        nextClient.write(head+html);
        println(head+html);
        break;
      case "/image.html":
                String html2 = getHTML("image.html");
        nextClient.write(head+html2);
        break;
      default:
        nextClient.write("<html><head><title>404</title></head><body><h1>404</h1></body></html>");
      }
    }


    myServer.disconnect(nextClient);
  }
}

String getHTML(String filename){
  String[] loaded = loadStrings(filename);
  String rows = "";
  for(String row : loaded){
    rows += row + "\n";
  }
  return rows;
}

String getHead() {
  String head = "";
  head += "HTTP/1.1 200 OK\r\n";
  head += "Server myServer\r\n";
  head += "Content-type: text/html\r\n";
  head += "\r\n";
  return head;
}
