//basic_Satellite4
//write satellite with class 
//2022/10/10
//1-4-45 Taiyu Honma
ArrayList<PlanetSatellite> ss = new ArrayList<PlanetSatellite>();
void setup(){
  size(500,500);
  for(int i=0;i<4;i++){
  ss.add(new PlanetSatellite());
  }
}
void draw(){
  background(255);
  for(PlanetSatellite ps : ss){
    ps.move();
    ps.display();
  }
}
