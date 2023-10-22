import processing.serial.*;
Serial my_serial;
int input;
void setup(){
  size(400,400);
  println(Serial.list()[1]);
  my_serial = new Serial(this, Serial.list()[1], 9600);
}

void draw(){
  background(0);
  rect(10,50, input  , 50);
}

void serialEvent(Serial port){
  input = port.read();
}
