class AgentNakamura334 extends JankenAgent {
  AgentNakamura334(){
    strAgentName = "Nakamura334";
  }
  int mode=0;

  // グー0, チョキ1, パー2とする
  int getNextHand()
  {
    // 自分の手を決める
    int myHand;
    if((int)random(10)==0){
      // 10回に1回はちょきを出しちゃおう
      myHand = 1;
    } else {
      if(enemyHistory.size() > 0) {
        // 相手の1回前の手に勝つ手を出す
        int lastEnemyHand = enemyHistory.get(enemyHistory.size()-1);
        if(lastEnemyHand == 0) myHand = 2;
        else if(lastEnemyHand == 1) myHand = 0;
        else myHand = 1;
      } else {
        // 初回はランダム
        myHand = (int)random(3);
      }
    }
    // 自分の手の記録を残しておく
    myHistory.add(myHand);
    return myHand;
  }
}
