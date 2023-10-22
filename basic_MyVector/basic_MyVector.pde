//basic_MyVector
//make vector calc library
//2022/10/03
//1-4-45 Taiyu Honma
void setup(){
  size(800, 800);
  background(255);
  MyVector vec1 = new MyVector(100, 300);
  MyVector vec2 = new MyVector(500, 200);
  
  vec1.display();
  vec2.display();
  
  vec1.add(vec2);
  stroke(255, 0, 0);
  vec1.display();
  
  vec2.multiply(1.5);
  stroke(0, 0, 255);
  vec2.display();
  
  vec1.divide(3);
  stroke(0, 255, 0);
  vec1.display();
  
  vec2.subtract(vec1);
  stroke(0, 255, 255);
  vec2.display();
  
  println("vec1の大きさ" + vec1.magnitude());
  println("vec2の大きさ" + vec2.magnitude());
}
