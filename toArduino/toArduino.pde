import processing.serial.*;
Serial my_serial;

void setup(){
  size(400,400);
  println(Serial.list()[1]);
  my_serial = new Serial(this, Serial.list()[1], 9600);
}

void draw(){
  background(0);
  
  if(mousePressed){
    my_serial.write('a');
    println("a");
  }else{
    my_serial.write('b');
  }
}
