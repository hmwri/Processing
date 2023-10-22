class VectorOperation {
  float[] avec = new float[]{};
  float[] bvec = new float[]{};
  void setVectorA(float[] a) {
    avec = a;
  }
  void setVectorB(float[] b) {
    bvec = b;
  }
  float calcVectorMagnitudeA(){
    float total = 0;
    for(float v : avec){
      total += v * v;
    }
    return sqrt(total);
  }
  float calcVectorMagnitudeB(){
    float total = 0;
    for(float v : bvec){
      total += v * v;
    }
    return sqrt(total);
  }
  float calcInnerProduct(){
    float total = 0;
    for(int i=0; i< avec.length ; i++){
      total += avec[i] * bvec[i];
    }
    return total;
  }
  float calcCosSimilarity() {
    return calcInnerProduct() /  (calcVectorMagnitudeB() * calcVectorMagnitudeA());
  }
  float calcArea(){
    return 0.5 * sqrt(pow(calcVectorMagnitudeA(),2)*pow(calcVectorMagnitudeB(),2) - pow(calcInnerProduct(),2));
  }
}
