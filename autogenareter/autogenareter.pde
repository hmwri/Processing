import javax.swing.*;
import java.awt.*;

JLayeredPane pane;
JTextField authorName,projectName,explanation;
JTextArea area;

void setup() {
  size(600, 600); 
  
  textSize(20);
  textAlign(CENTER);
  
  rect(50,280,500,40);
  fill(0);
  text("Generate",300,305);
  text("Your Name ( 1-4-45 efuemu esu )",300,40);
  Canvas canvas = (Canvas) surface.getNative();
  pane = (JLayeredPane) canvas.getParent().getParent();
  authorName = new JTextField();
  authorName.setBounds(50, 50, 500, 30);
  text("Sketch Name (advanced_FMS)",300,120);
  projectName = new JTextField();
  projectName.setBounds(50, 130, 500, 30);
  text("Sketch Explanation (write FMS image)",300,200);
  explanation = new JTextField();
  explanation.setBounds(50, 210, 500, 30);
  pane.add(projectName);
  pane.add(authorName);
  pane.add(explanation);
}

boolean clickedflag = false;

void draw(){
  if(!clickedflag){
  explanation.setText(projectName.getText());
  }
}
void mousePressed(){
  if((mouseX > 50 && mouseX < 550) && (mouseY > 210 && mouseY < 240)){
    println("h");
    clickedflag = true;
  }
}
void keyPressed() {
  
}
