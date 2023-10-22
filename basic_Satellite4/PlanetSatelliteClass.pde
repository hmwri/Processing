class PlanetSatellite extends ObjectBase {
  int theta;
  int theta2;
  ArrayList<Satellite> satellites = new ArrayList<Satellite>();
  PlanetSatellite(){
    super(color(255,0,0));
    theta = (int)random(360);
    theta2 = (int)random(360);
    satellites.add(new Satellite(this,10,50,5,color(255,0,0)));
    satellites.add(new Satellite(this,5,80,3,color(0,0,255)));
    satellites.add(new Satellite(this,5,80,3,color(0,0,255)));
  }
  void display(){
    ellipse(x,y,30,30);
    for(Satellite s : satellites){
      s.display();
    }
  }
}
