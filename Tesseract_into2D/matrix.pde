float[][] vec4ToMatrix(P4Vector v){
  float[][] m = new float[4][1];
  m[0][0] = v.x;
  m[1][0] = v.y;
  m[2][0] = v.z;
  m[3][0] = v.w;
  return m;
}

float[][] vec3ToMatrix(PVector v){
  float[][] m = new float[3][1];
  m[0][0] = v.x;
  m[1][0] = v.y;
  m[2][0] = v.z;
  return m;
}

PVector matrixToVec(float [][] m){
  PVector v = new PVector();
  v.x = m[0][0];
  v.y = m[1][0];
  if(m.length > 2){
    v.z = m[2][0];
  }
  return v;
}

P4Vector matrixToVec4(float [][] m){
  P4Vector v = new P4Vector(0, 0, 0, 0);
  v.x = m[0][0];
  v.y = m[1][0];
  v.z = m[2][0];
  v.w = m[3][0];
  return v;
}

void logMatrix(float[][] m){
  int cols = m[0].length; 
  int rows = m.length;
  println(rows + "x" + cols);
  println("----------------");
  for (int i = 0; i < rows; i++){
    for (int j = 0; j < cols; j++){
      print(m[i][j] + " ");
    }
    println();
  }
  println();
}

PVector matmul(float[][]a, PVector b){
  float[][] m = vec3ToMatrix(b);
  return matrixToVec(matmul(a, m));
}

PVector matmul(float[][]a, P4Vector b){
  float[][] m = vec4ToMatrix(b);
  return matrixToVec(matmul(a, m));
}

P4Vector matmul(float[][]a, P4Vector b, boolean dim4){
  float[][] m = vec4ToMatrix(b);
  return matrixToVec4(matmul(a, m));
}

float [][] matmul(float[][]a, float[][]b){
  int colsA = a[0].length; 
  int rowsA = a.length;
  int colsB = b[0].length; 
  int rowsB = b.length;
  
  if(colsA != rowsB){
    println("Columns of A must match rows of B");
    return null;
  }
  float result[][] = new float [rowsA][colsB];
    for (int i = 0; i < rowsA; i++){
      for (int j = 0; j < colsB; j++){
        //Dot product pf value in col
        float sum = 0;
        for(int k = 0; k < colsA/* == rowsB*/; k++){
          sum += a[i][k] * b[k][j];
        }
        result[i][j] = sum;
      }
    }
    return result;
}
