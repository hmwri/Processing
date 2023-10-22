//basic_visCOVID19
//visualize covid 19 data
//2022/11/14
//1-4-45 Taiyu Honma
void setup(){
  size(1000,800);
  String[] data = loadStrings("data.csv");
  float w = float(width - 10) / float(data.length-1);
  println(w);
  for(int i=1; i< data.length; i++)
  {
    String row = data[i];
    String[] splited_row = split(row,",");
    float value = float(int(splited_row[4]));
    
    rect((i-1)*w,height - value/60.0,w, height);
  }
}
