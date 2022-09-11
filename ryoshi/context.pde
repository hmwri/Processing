import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;


class context {
  lexer l ;
  errorManager eM;
  context(String code) {
    eM = new errorManager();
    l = new lexer(code, eM);
  }
  void exe() throws Exception {
    ArrayList<token> result =  l.lex();
    Parser parser = new Parser(result, eM);
    Program program = parser.parse();
    print(program.Str());
    compiler c = new compiler(program, eM);
    String[] str = c.compile();
    println("result:");
    for (String s : str) {
      println(s);
    }
    saveStrings("data/compiled.py", str);
    ProcessBuilder pb = new ProcessBuilder("/usr/local/bin/python3","compiled.py");
    pb.directory(new File( dataPath("")));
    pb.redirectErrorStream(true);
    Process  p  = pb.start();
    BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
    String stdout = "";
    while (stdout != null) {
      stdout = br.readLine();
      println(stdout);
    }

    eM.print();
  }
}
