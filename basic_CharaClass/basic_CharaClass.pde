//basic_CharaClass
//write chara with class 
//2022/10/10
//1-4-45 Taiyu Honma
CharacterBase charaSample = new CharacterBase();

// こちらを自分のクラスに差し替えてください
ExHonma445 myChara = new ExHonma445();

void setup()
{
  size(800, 800);
}

void draw()
{
  background(255);
  charaSample.move();
  myChara.move();

  if (mousePressed) {
    charaSample.displayInactive();
    myChara.displayInactive();
  } else {
    charaSample.displayActive();
    myChara.displayActive();
  }
}
