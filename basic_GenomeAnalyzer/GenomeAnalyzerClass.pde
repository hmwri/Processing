class GenomeAnalyzer {
  String genome = "";
  // ゲノムの長さ
  int len ;
  GenomeAnalyzer(String _genome){
    genome = _genome;
    len = genome.length();
  }
  float calcRatio(char c) {
    float count = 0;
    // ゲノムを一つずつ見て言って割合を計算
    for(int i= 0;i< genome.length();i++){
      if (c == genome.charAt(i)) count++;
    }
    return count / float(len);
  }
  int length(){
    return len;
  }
  int countPattern(String target){
    int count = 0;
    // i:現在見ている文字のindex
    int i=0;
    while(true) {
      // i番目以降のgenomeから、targetを探し出す
      // 見つからなかったら-1, 見つかったら見つかった場所
      i = genome.indexOf(target, i);
      // -1だった場合もう以降にないのでループ終了
      if(i == -1 ) break;
      // 同じパターンを数えないように、現在位置をパターンの長さ分後ろに下げる
      i += target.length();
      count++;
    }
    return count;
  }
}
