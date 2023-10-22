
class Styles implements Cloneable{
  int fontsize = 16;
  int lineHeight = 18;
  boolean bold = false;
  boolean link = false;
  String linkURL = "";
  int align = LEFT;
  color fontColor = color(0);
  int padding = 2;
  int margin = 2;
  boolean underLine = false;
  PFont Bfont = null;
  PFont Mfont = null;
  Styles(){
    Bfont = loadFont("SourceHanCodeJP-Bold-48.vlw");
    Mfont = loadFont("SourceHanCodeJP-Medium-48.vlw");
  }
  @Override
  public Styles clone() throws CloneNotSupportedException {
    Styles clone = (Styles) super.clone();
    return clone;
  }
  void setFontSize(int size){
    fontsize = size;
    lineHeight = size+2;
  }
    void setFontSize(int size, int padding){
    fontsize = size;
    lineHeight = size+padding;
  }
}
