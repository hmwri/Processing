//basic_ManyChara
//write many chara with class
//2022/10/17
//1-4-45 Taiyu Honma
CharacterBase charaSample = new CharacterBase();

// こちらを自分のクラスに差し替えてください
ArrayList<CharacterBase> charas = new ArrayList<CharacterBase>();


void setup()
{
  charas.add(new CharacterBase());
  charas.add(new ExHonma445());
  charas.add(new ExIwatsuki405());
  charas.add(new ExIshida308());
  charas.add(new E1Matsunaga349());
  charas.add(new ExTsuda433());
  charas.add(new ExHashimoto343());
  charas.add(new ExSato420());
  charas.add(new ExIshii306());
  size(800, 800);
}

void draw()
{
  background(255);
  for (CharacterBase chara : charas) {
    chara.move();
  }

  if (mousePressed) {
    for (CharacterBase chara : charas) {
      strokeWeight(2);
      chara.displayInactive();
    }
  } else {
    for (CharacterBase chara : charas) {
      strokeWeight(2);
      chara.displayActive();
    }
  }
}
