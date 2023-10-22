class JankenAgent {
  ArrayList<Integer> enemyHistory;
  ArrayList<Integer> myHistory;
  String strAgentName;
  
  JankenAgent()
  {
    enemyHistory = new ArrayList<Integer>();
    myHistory = new ArrayList<Integer>();
    strAgentName = "JankanAgent";
  }
  
  String getAgentName(){
    return strAgentName;
  }
  
  // グー0, チョキ1, パー2とする
  void addLastEnemyHand(int hand)
  {
    // 相手の出した手の記録を残しておく
    enemyHistory.add(hand);
  }
  
  // グー0, チョキ1, パー2とする
  int getNextHand()
  {
    // 自分の手を決める
    int myHand;
    // ランダムに手を決める
    myHand = (int)random(3);
    // 自分の手の記録を残しておく
    myHistory.add(myHand);
    return myHand;
  }
}
