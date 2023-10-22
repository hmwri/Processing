//hm_JankenGuriko
//calc Janken Guriko
//2022/10/10
//1-4-45 Taiyu Honma
void setup()
{
  // AgentNakamura999 を自分のものに変更してください
  AgentHonma445 myAgent = new AgentHonma445();
  
  // 対戦相手のAgentをロード
  AgentNakamura334 enemyAgent1 = new AgentNakamura334();
  JankenAgent enemyAgent2 = new JankenAgent();
  
  // myAgentと2つの敵を対戦！
  battle(myAgent, enemyAgent1);
  battle(myAgent, enemyAgent2);
}

void battle(JankenAgent agent1, JankenAgent agent2)
{
  int agent1Point = 0;
  int agent2Point = 0;
  int[] pointJanken = {3, 5, 6};
  
  while (agent1Point<10000 && agent2Point<10000)
  {
    int agent1Hand = agent1.getNextHand();
    int agent2Hand = agent2.getNextHand();
    
    if (agent1Hand == agent2Hand){;} // 引き分け
    else if ((agent1Hand+1)%3==agent2Hand){ // a1の勝ち
      agent1Point += pointJanken[agent1Hand];
    } else { // a2の勝ち
      agent2Point += pointJanken[agent2Hand];
    }
    
    agent1.addLastEnemyHand(agent2Hand);
    agent2.addLastEnemyHand(agent1Hand);
  }

  println("["+agent1.getAgentName() + " vs. " + agent2.getAgentName()+"]");
  println(agent1.getAgentName()+"の進んだマス", agent1Point);
  println(agent2.getAgentName()+"の進んだマス", agent2Point); 

  if(agent1Point > agent2Point)
    println(agent1.getAgentName()+"の勝利です");
  else 
    println(agent2.getAgentName()+"の勝利です");
  
  // 最後に空行を入れる
  println();
}
