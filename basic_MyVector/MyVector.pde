class MyVector {
  float x;
  float y;
  
  MyVector(float _x, float _y){
    x = _x;
    y = _y;
  }
  
  void display(){
    strokeWeight(2);
    line(0, 0, x, y);
    // 矢じりも表示する
    float r = 30;
    float theta = atan2(y, x);
    line(x, y, x+r*cos(theta-PI*3/4), y+r*sin(theta-PI*3/4));
    line(x, y, x+r*cos(theta+PI*3/4), y+r*sin(theta+PI*3/4));
  }
  
  void add(MyVector _vec){
    this.x += _vec.x;
    this.y += _vec.y;
  }

  void subtract(MyVector _vec){
        this.x -= _vec.x;
    this.y -= _vec.y;
  }

  void multiply(float _n){
    this.x*=_n;
    this.y*=_n;
  }

  void divide(float _n){
        this.x/=_n;
    this.y/=_n;
  }
  
  float magnitude(){
    return sqrt(x*x+y*y);
  }
}
