


void convert() {
  
  byte b[] = loadBytes("target.png"); 
  String result = "";
  for (int i = 0; i < b.length; i++) {
    int a = Byte.toUnsignedInt(b[i]);
    println(a);
    String str = Integer.toBinaryString(a);
    str = String.format("%8s", str).replace(' ', '0');
    println(str);
    result += str;
  }
  String result2 = "";
  for(int i=0;i<result.length();i++){
    if(result.charAt(i) == '0'){
      result2 += '雨';
    }else{
      result2 += '飴';
    }
  }
  println(result2);
  PrintWriter output = createWriter("ameame.txt");
  String saves = result2;
  output.println(saves);
  output.flush();
  output.close();
  message = "変換完了。変換結果:ameame.txt 確認してみてください";
  //decode(result2);
}

void decode(String a){
  
  byte[] result = new byte[a.length()/8];
  for ( int i = 0; i < a.length()/8; i++ ) {
    byte b = 0;
    for ( int j = 0; j < 8; j++ ) {
      switch(a.charAt(i*8+j)) {
        case '雨':
          break;
        case '飴':
          b += pow(2,8-j-1);
         break;
       }
    }
    result[i] = b;
    
    
  }
  saveBytes("result.png", result);
  message = "ameame.txtを変換できました。変換結果はresult.pngです";
}


void setup(){
  size(600,600);

}

void mousePressed(){
  if(dist(mouseX,mouseY,400,150)<15){
    message = "target.pngを雨と飴に変換します";
    convert();
  }
  if(dist(mouseX,mouseY,400,200)<15){
    message = "ameame.txtを画像に変換します";
    decode(loadStrings("ameame.txt")[0]);
  }
}
String message = "";
void draw(){
  background(100);
    textSize(30);
  text("Ame,Ame Image Encryption system", 50,50);
  text("Encrypt(target.png)", 50,150);
  text("Decrypt (ameame.txt)", 50,200);
  ellipse(400,150,30,30);
  ellipse(400,200,30,30);
  textSize(20);
  text(message, 50,400);
}
