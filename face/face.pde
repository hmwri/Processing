JSONObject json;
void setup() {
  size(1000,1000);
  background(255);
  String[] lines = loadStrings("~/python/face/test.json");
  if(lines.length==0){
    println("THERE IS NO LINE");
  }
}
