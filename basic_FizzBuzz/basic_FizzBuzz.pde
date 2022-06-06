//basic_FizzBuzz
//solve fizzbuzz problem
//2022/05/23
//1-4-45 Taiyu Honma

void setup(){
  frameRate(10);
}
int n = 0;
void draw(){
  n++;
  if(n % 3 == 0 && n%5 == 0){
    println("FizzBuzz");
    return;
  }
  if(n % 3 == 0){
    println("Fizz");
    return;
  }
  if(n % 5 == 0){
    println("Buzz");
    return;
  }
  println(n);
  
}
