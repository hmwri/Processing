float[][] vert = {

};
int[][] tri = {

};

void setup() {
  size(1280, 720, P3D);
  String[] lines = loadStrings("bunny.obj");
  println("there are " + lines.length + " lines");
  ArrayList<float[]> vs = new ArrayList<float[]>();
  ArrayList<int[]> fs = new ArrayList<int[]>();
  for (int i = 0; i < lines.length; i++) {
    if (lines[i].charAt(0)== '#') {
      continue;
    }
    String[] splited = split(lines[i], " ");
    String command = splited[0];
    if (command.equals("v")) {
      float[] v = {Float.parseFloat(splited[1]), Float.parseFloat(splited[2]), Float.parseFloat(splited[3])};
      vs.add(v);
    } else if (command.equals("f")) {
      println(splited.length);
      if (splited.length == 5) {
        int[] f = {Integer.parseInt(splited[1]), Integer.parseInt(splited[2]), Integer.parseInt(splited[3]), Integer.parseInt(splited[4])};
        fs.add(f);
      } else {
        int[] f = {Integer.parseInt(splited[1]), Integer.parseInt(splited[2]), Integer.parseInt(splited[3])};
        fs.add(f);
      }
    }
  }


  vert = new float[vs.size()][];
  tri = new int[fs.size()][];
  int i=0;
  for (float[]v : vs) {
    vert[i] = v;
    i++;
  }
  i=0;
  for (int[]f : fs) {
    tri[i] = f;
    i++;
  }
  i=0;
  for (float[]v : vert) {
    println(v[0], v[1], v[2]);
    i++;
    if (i>100) {
      break;
    }
  }
  for (int[]f : tri) {
    println(f);
  }

  println("end!");
}


void draw() {
  background(0);
  fill(255);
  perspective(
    radians(45), // 視野角
    float(width)/float(height), // アスペクト比
    0.0001, 1000.0                   // クリッピング距離
    );

  camera(
    0, 0, -0.5, // 視点：カメラの位置
    0, 0.1, 0, // 中心点：ここが視界の中心に映るようにする
    0, -1, 0
    );
  rotateY(radians(mouseX));
  for (int[] t : tri) {
    beginShape(t.length==4 ? QUAD:TRIANGLE);
    for (int i=0; i<t.length; i++) {
      int v_i = t[i] - 1;
      //println(vert[v_i][0]);
      vertex(vert[v_i][0], vert[v_i][1], vert[v_i][2]);
    }
    endShape(CLOSE);
  }
}
