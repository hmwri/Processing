Motion motion;
void setup() {
  size(1000, 1000);
  motion = new Motion();
}
int bodyw = 150;
int bodyh = 200;
int lowerbodyh = 100;
int facer = 50;
int armLength = 120;
int armw = 50;
int legw = 70;
int legLength = 150;
void draw() {
  background(100);
  motion.Move(JOINTS.BodyX, frameCount);
  motion.Move(JOINTS.BodyY, frameCount);
  translate(width/2, 200);
  drawUpperBody();
  pushMatrix();
  motion.Move(JOINTS.Neck, frameCount);
  drawHead();
  popMatrix();

  pushMatrix();
  translate(bodyw/2, armw/2);
  pushMatrix();
  motion.Move(JOINTS.RightShoulder, frameCount);
  drawRightUpperArm();
  translate(armLength, 0);
  motion.Move(JOINTS.RightElbow, frameCount);
  drawRightLowerArm();
  popMatrix();
  popMatrix();
  pushMatrix();
  translate(-bodyw/2, armw/2);
  pushMatrix();
  motion.Move(JOINTS.LeftShoulder, frameCount);
  drawLeftUpperArm();
  translate(-armLength, 0);
  motion.Move(JOINTS.LeftElbow, frameCount);
  drawLeftLowerArm();
  popMatrix();
  popMatrix();
  translate(0, bodyh);
  motion.Move(JOINTS.Hip, frameCount);
  drawLowerBody();
  translate(0, lowerbodyh);
  pushMatrix();
  translate(-legw/2, 0);
  pushMatrix();
  motion.Move(JOINTS.LeftThigh, frameCount);
  drawLeftUpperLeg();
  translate(0, legLength);
  motion.Move(JOINTS.LeftKnee, frameCount);
  drawLeftLowerLeg();
  popMatrix();
  popMatrix();
  pushMatrix();
  translate(+legw/2, 0);
  pushMatrix();
  motion.Move(JOINTS.RightThigh, frameCount);
  drawRightUpperLeg();
 translate(0, legLength);
  motion.Move(JOINTS.RightKnee, frameCount);
  drawRightLowerLeg();
  popMatrix();
  popMatrix();
}



void drawHead() {
  ellipse(0, -facer, facer*2, facer*2);
}

void drawRightUpperArm() {
  rect(0, -armw/2, armLength, armw);
}

void drawRightLowerArm() {
  rect(0, -armw/2, armLength, armw);
}
void drawLeftUpperArm() {
  rect(-armLength, -armw/2, armLength, armw);
}
void drawLeftLowerArm() {
  rect(-armLength, -armw/2, armLength, armw);
}
void drawUpperBody() {
  rect(-bodyw/2, 0, bodyw, bodyh);
}
void drawLowerBody() {
  rect(-bodyw/2, 0, bodyw, lowerbodyh);
}
void drawLeftUpperLeg() {
  rect(-legw/2, 0, legw, legLength);
}
void drawRightUpperLeg() {
  rect(-legw/2, 0, legw, legLength);
}
void drawLeftLowerLeg() {
  rect(-legw/2, 0, legw, legLength);
}
void drawRightLowerLeg() {
  rect(-legw/2, 0, legw, legLength);
}
