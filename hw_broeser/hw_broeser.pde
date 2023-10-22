//hw
//ブラウザを作成しました。
//Macで作業しているため、Windowsで実行すると環境の差異によって動かなくなってしまうかもしれません。
//フォントが主な原因かと思われます。
//2022/11/23
//1-4-45 Taiyu Honma

import processing.net.*;
import java.nio.charset.StandardCharsets;
import java.net.URL;

Client myClient = new Client(this, "abehiroshi.la.coocan.jp", 80 );



void setup() {
  try{
  URL baseURL = new URL("http://www.example.com/dir1/index.html");
  println(new URL(baseURL, "http://www.example.com/dir1/a.htm"));
  } catch(Exception e){
    println(e);
  }
  HTMLParser p = new HTMLParser("<html><html>こんにちは<h1>Hi</h1></html></html>");
  Object parsed = p.Parse();
  parsed.Print(0);
  myClient.write("GET /menu.htm HTTP/1.1\nHost: abehiroshi.la.coocan.jp\nAccept-Charset: utf-8\r\n\r\n'");
  size(400,400);
}

void draw() {
  if (myClient.available() > 0) {
    byte[] dataIn = myClient.readBytes();
    try{
    String str = new String(dataIn , "utf-8");
    println(str);
    Response r = new Response(str);
    println(r.body);
    HTMLParser p = new HTMLParser(r.body);
    Object parsed = p.Parse();
    parsed.Print(0);
    Render render = new Render(parsed);
    render.rend();
    }catch(Exception e){
      println(e);
    }
  }
}

void load(){
  
  
}

void stop() {
  myClient.stop();
}
