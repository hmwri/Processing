//hw_SwitchLight
//create class of light component
//2022/10/03
//1-4-45 Taiyu Honma
SwitchLight[] sls = new SwitchLight[5];
void setup(){
  size(400,500);
  for(int i=0;i < sls.length;i++){
    sls[i] = new SwitchLight(false,i%2 == 0 ? 100 : 300,100 + i* 80);
  }
}
void draw(){
    for(SwitchLight sl : sls){
    sl.draw();
  }
}

void mousePressed(){
  for(SwitchLight sl : sls){
    sl.inspectClick();
  }
}
