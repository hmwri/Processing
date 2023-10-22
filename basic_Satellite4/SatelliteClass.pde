class Satellite{
  int theta = 0;
  PlanetSatellite planet;
  int vtheta;
  int r;
  int d;
  color c ;
  Satellite(PlanetSatellite _planet,int _r,int _d,int _vtheta,color _c){
    theta = (int)random(360);
    d = _d;
    planet = _planet;
    c = _c;
    r = _r;
    vtheta = _vtheta;
  }
  void display(){
    theta += vtheta;
    float sx = planet.x + d * cos(radians(theta));
    float sy = planet.y + d * sin(radians(theta));
    fill(c);
    ellipse(sx,sy,r,r);
  }
}
