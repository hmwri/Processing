
ArrayList<Complex> data = new ArrayList<Complex>();
int N;
float easing = 0;

//フーリエ変換
Complex F(int k) {
  Complex result = new Complex(0,0);
  for(int n = 0; n <N; n++){
    float arg = ((2*PI*k)/float(N))*n;
    //一旦a+biの形に直す。
    result = result.plus(data.get(n).multi(new Complex(cos(arg),-sin(arg))));
  }
  return result.multi(new Complex(1/float(N),0));
}

void setup(){
  size(1000,1000);
  translate(500,500);
  frameRate(100);
}

class arcF {
  ArrayList<Complex> fs = new ArrayList<Complex>();
  //逆フーリエ結果の関数の係数
  FloatList a = new FloatList();
  FloatList b = new FloatList();
  FloatList c = new FloatList();
  FloatList xs = new FloatList();
  FloatList ys = new FloatList();
  //フーリエ変換を行った結果を元に関数を求める(a(cos(bθ+ c) + isin(bθ + c)）の形
  arcF(){
    for(int k=0;k <N;k++){
      float arg = ((2*PI*k)/float(N));
      Complex f = F(k);
      fs.add(f);
      a.append(f.abs());
      b.append(arg);
      c.append(f.arg());
    }
  }
  //関数をもとに描画
  void draw(int t){
      int x = 0;
      int y = 0; 
      for(int i=0;i<N;i++){
        float a = this.a.get(i);
        float b = this.b.get(i);
        float c = this.c.get(i);
        if(a > easing){
            noFill();
            ellipse(x,y,a*2,a*2);
            x += int(a*cos(b*t+c));
            y += int(a*sin(b*t+c));
        }
      }
      fill(0);
      xs.append(x);
      ys.append(y);
      ellipse(x,y,10,10);
  }
  //xs,ysに保存されている座標を描画
  void drawShape(){
    strokeWeight(10);
    for(int i=0;i < xs.size();i++){
      
      if(i != xs.size() - 1){
        line(xs.get(i),ys.get(i),xs.get(i+1),ys.get(i+1));
      }else{
        
         line(xs.get(i),ys.get(i),xs.get(0),ys.get(0));
    
      }
     
    }
         strokeWeight(1);
  }
  //書き直す
  void drawAll(){
    frameRate(120);
    background(255);
    xs = new FloatList();
    ys = new FloatList();
    formating = true;
    t = 0;
  }
}

void keyPressed() {
    switch (keyCode) {
      case UP:
        easing += 5;
        arcf.drawAll();
        break;
      case DOWN:
        easing -= 5;
        arcf.drawAll();
    }  
}
boolean drawing = false;
boolean formating = false;
arcF arcf;
int t = 0;
void draw(){
  background(255);
  stroke(255,0,0);
  fill(0);
  textSize(30);
  text("eaing"+easing,10,30);
  for (int i = 0; i < data.size(); ++i) {
    Complex start = data.get(i);
    if(i != data.size()  - 1){
      Complex end = data.get(i+1);
      line(start.real,start.img,end.real,end.img);
    }
  }
  stroke(0);
  if(drawing){
    frameRate(60);
    data.add(new Complex(mouseX,mouseY));
  }
  if(formating){
    frameRate(50);
    arcf.draw(t);
    t++;
    if(t == N - 1){
      formating = false;
      t = 0;
    }
  }
  if(arcf != null){
    arcf.drawShape();
  }
  
}

void mousePressed(){
  data = new ArrayList<Complex>();
  drawing = true;
}

void mouseReleased(){
  drawing = false;
  N = data.size();
  arcf = new arcF();
  formating = true;

}

//複素数
class Complex {
    float real;   
    float img;   

    public Complex(float real, float img) {
        this.real = real;
        this.img = img;
    }
    //掛け算
    public Complex multi(Complex b) {
        float real = this.real * b.real - this.img * b.img;
        float img = this.real * b.img + this.img * b.real;
        return new Complex(real, img);
    }
    //+
    public Complex plus(Complex b) {
        return new Complex(this.real+b.real, this.img+b.img);
    }
    //絶対値
    public float abs() {
        return sqrt(real*real+img*img);
    }
    //偏角を求める
  float arg()
  {
    float x = real;
    float y = img;
    if(x>0){
      return atan(y/x);
    }
    if(x<0 && y>=0){
      return atan(y/x) + PI;
    }
    if(x<0 && y<0){
      return atan(y/x) - PI;
    }
    if(x==0 && y>0){
      return HALF_PI;
    }
    if(x==0 && y<0){
      return -HALF_PI;
    }
    else{
      return 0;
    }      
  }
}
