
// 内積を求める
float calcInnerProduct(float[] _array1, float[] _array2) {
  float retValue = 0;
  for (int i=0; i<_array1.length; i++)
    retValue += _array1[i] * _array2[i];
  return retValue;
}

// 大きさを求める
float calcMagnitude(float[] _array) {
  float total = 0;
  for (int i=0; i<_array.length; i++)
    total += _array[i] * _array[i];
  return sqrt(total);
}

// とりあえず次元は一致してるものとする
float calcSimilarity(float[] _array1, float[] _array2) {
  return calcInnerProduct(_array1, _array2) /
    (calcMagnitude(_array1) * calcMagnitude(_array2));
}

void setup(){
  float[] array1 = {0,0,2,-1,0,2};
  float[] array2 = {2,2,0,0,2,0};
  println( calcSimilarity(array1, array2) );
}
