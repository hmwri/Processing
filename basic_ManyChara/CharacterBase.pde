class CharacterBase {
  int centerX;
  int centerY;
  int speedX;
  int speedY;

  CharacterBase() {
    // こっちは編集しないで！
    centerX = (int)random(width);
    centerY = (int)random(height);
    speedX = (int)random(1, 5);
    speedY = (int)random(1, 5);
  }

  void move()
  {
    // こっちは編集しないで！
    centerX += speedX;
    centerY += speedY;
    if (centerX < 0) {
      speedX = -speedX;
      centerX = -centerX;
    }
    if (centerY < 0) {
      speedY = -speedY;
      centerY = -centerY;
    }
    if (centerX > width) {
      speedX = -speedX;
      centerX = width * 2 - centerX;
    }
    if (centerY > height) {
      speedY = -speedY;
      centerY = height * 2 - centerY;
    }
  }

  void displayActive()
  {
    // こっちは編集しないで！
    pushMatrix();
    translate(centerX, centerY);

    fill(255);
    stroke(0);
    rect(-30, 30, 60, 60);

    popMatrix();
  }

  // 非活性状態のキャラクタを描く
  void displayInactive()
  {
    // こっちは編集しないで！
    pushMatrix();
    translate(centerX, centerY);

    fill(0);
    stroke(0);
    rect(-30, 30, 60, 60);

    popMatrix();
  }
}
