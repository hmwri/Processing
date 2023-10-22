class VendingMachine {
  // 各硬貨の残り枚数
  int remain10;
  int remain50;
  int remain100;
  // 投入された硬貨の枚数
  int n10;
  int n50;
  int n100;
  // initialize メソッドを用意しろとヒントがありますが、私はその機能を
  // コンストラクタにて代用しました。
  VendingMachine(int _n10, int _n50, int _n100) {
    remain10 = _n10;
    remain50 = _n50;
    remain100 = _n100;
  }
  
  //投入処理、　投入された硬貨の枚数を記録し、残りの硬貨枚数に加算
  void insert(int _n10, int _n50, int _n100) {
    n10 = _n10;
    n50 = _n50;
    n100 = _n100;
    remain10 += n10;
    remain50 += n50;
    remain100 += n100;
  }
  // 投入された金額を計算
  int calcInsertTotal() {
    return n10*10+n50*50+n100*100;
  }

  void cancel() {
    reverse();
    println("商品を購入できません。"+String.format("10円%d枚,50円%d枚,100円%d枚を返却します。", n10, n50, n100));
  }
  
  // 返金処理
  void reverse() {
    remain10 -= n10;
    remain50 -= n50;
    remain100 -= n100;
  }
  
  // 購入処理
  void buy(int p) {
    // 釣りの金額を計算
    int change = calcInsertTotal() - p;
    if (change == 0) {
      println("ありがとうございました。お釣りはありません");
      return;
    }
    if (change < 0) {
      cancel();
      return;
    }
    
    // 排出すべき硬貨を取得
    int[] changes = makechange(change);
    // お釣りを払えない場合-1が帰るため、キャンセル
    if(changes[0] == -1){
      cancel();
      return;
    }
    println("ありがとうございました。お釣りは"
    +String.format("10円%d枚,50円%d枚,100円%d枚です。", changes[0],changes[1],changes[2]));
  }
  
  // お釣り(硬貨をどのように排出するか)を計算し、排出する関数
  // c:お釣りの金額
  int[] makechange(int c) {
    // 何枚、100円玉を返すべきかを計算する
    // floor(c/100)で何枚100円玉が必要か計算し
    // min で、必要な100円玉と、残っている100円玉の小さい方を採用している
    // これにより、残っている100円玉の枚数以上の100円玉が排出されることはない
    int c100 = min(floor(c / 100),remain100);
    // お釣りを排出する(予定)の分だけ減らす
    c -= c100*100;
    // 繰り返し
    int c50 = min(floor(c / 50),remain50);
    c -= c50*50;
    int c10 = min(floor(c / 10),remain10);
    c -= c10*10;
    // お釣りが0にならない = 払えない場合、-1を返す
    if(c != 0) return new int[]{-1};
    // ここで、お釣りが払えることが確定しているため、残りの枚数を変更し排出
    remain10 -= c10;
    remain50 -= c50;
    remain100 -= c100;
    // 結果を返す
    return new int[]{c10,c50,c100};
  }
}
