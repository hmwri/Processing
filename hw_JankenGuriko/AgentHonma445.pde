class AgentHonma445 extends JankenAgent {
  AgentHonma445() {
    strAgentName = "Honma445";
  }
  int i=0;
  // グー0, チョキ1, パー2とする
  int getNextHand() {
    i++;
    // 自分の手を決める
    int myHand = i % 2 == 0? 1 :2;
    return myHand;
  }
}
