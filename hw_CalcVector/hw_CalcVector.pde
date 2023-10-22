//hw_CalcVector
//make class for calculating vector
//2022/10/17
//1-4-45 Taiyu Honma
void setup() {
  VectorOperation vo = new VectorOperation();
  float[] vectorA = {10, 0, 1, 9};
  float[] vectorB = {8, 1, 1, 4};
  vo.setVectorA(vectorA);
  vo.setVectorB(vectorB);

  println("Aの大きさ", vo.calcVectorMagnitudeA());
  println("Bの大きさ", vo.calcVectorMagnitudeB());

  println("内積", vo.calcInnerProduct());
  println("コサイン類似度", vo.calcCosSimilarity());
  println("面積", vo.calcArea());
}
