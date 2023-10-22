import processing.serial.*;
Serial my_serial;
void setup(){
  size(400,400);
  println(Serial.list()[1]);
  my_serial = new Serial(this, Serial.list()[1], 9600);
  delay(2000);
  my_serial.write('a');
}

void draw(){
 
  if(my_serial.available() > 0){
    String inString = my_serial.readStringUntil('\n');
    if(inString != null){
      inString = trim(inString);
      int data[] = int(split(inString, ','));
      println("x=", data[0], "y=", data[1]);
      my_serial.write('a');
    }
  }
  background(0);
}
