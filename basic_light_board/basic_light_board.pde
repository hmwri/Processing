int[][] lights = new int[4][3];

void setup()
{
  size(400,300);
  String[] lines = loadStrings("status.txt");
  for(int x=0;x<4 && lines != null;x++){
    for(int y=0;y<3;y++){
      lights[x][y] = int(String.valueOf(lines[y].charAt(x*2)));
    }
  }
}

void draw(){
  background(255);
  for(int x=0;x<4;x++)
  {  for(int y=0;y<3;y++)
  {
    if(lights[x][y] == 1)
    {
      fill(255,0,0);
    }else{
      fill(255);
    }
    ellipse(100*x+50,100*y+50,100,100);
  }
  }
}
void mousePressed(){
  for(int x=0;x<4;x++){
    for(int y=0;y<3;y++){
      if(dist(100*x+50,100*y+50,mouseX,mouseY)<=50){
        lights[x][y] = lights[x][y] == 1 ? 0 : 1;
      }
    }
  }
  String[] saveLines = new String[3];
  for(int y=0; y<3; y++){
    saveLines[y] = "";
    for(int x=0; x<4; x++){
      saveLines[y] += (lights[x][y] + (x == 3 ? "" : ","));
    }
  }
  saveStrings("status.txt", saveLines);
}
