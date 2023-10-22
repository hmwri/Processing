// Player操作のためにキー状態を管理するクラス
// HashMapを使ってキーコードと状態（True，False）をまとめて管理
class Key{
  HashMap<Integer,Boolean> keys;
  
  Key(){
    this.keys = new HashMap<Integer,Boolean>();
  }
  
  // 指定したキーコード（int keycode）に，
  // 入力状態（boolean b）を入れる
  void set(int keycode, boolean b){
    this.keys.put(keycode,b);
  }
  
  // 引数で指定したキーコードが押されているか調べる
  // アルファベットのキーは大文字で渡す
  // e, keys.isPressed('A')
  boolean isPressed(int keycode){
    if(!this.keys.containsKey(keycode)){
      return false;
    }
    return this.keys.get(keycode);
  }  
}
