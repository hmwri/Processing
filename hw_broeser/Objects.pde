class Attribute {
  String name;
  String value;
  Attribute(String _name, String _value) {
    name = _name;
    value = _value;
  }
  void Print() {
    print(";Attribute:"+name+"="+value);
  }
}
class Tag extends Object {
  String name;
  ArrayList<Attribute> attributes;
  Tag(String _tagName, ArrayList<Attribute> attrs) {
    name = _tagName.toLowerCase() ;
    attributes = attrs;
  }
  void Print(int depth) {
    print("\n");
    for(int i=0;i<depth;i++){
      print("-");
    }
    print("Tag:"+name);
    if (attributes != null) {
      for (Attribute attr : attributes) {
        attr.Print();
      }
    }

    if (Children != null) {
      for (Object obj : Children) {
        obj.Print(depth+1);
      }
    }
  }
}
class Text extends Object {
  String body;
  Text(String _body){
    body = _body;
  }
  void Print(int depth) {
    print("\n");
    for(int i=0;i<depth;i++){
      print("-");
    }
    print(body);
  }
}
abstract class Object {
  ArrayList<Object> Children = new ArrayList<Object>();
  abstract void Print(int depth);
}
