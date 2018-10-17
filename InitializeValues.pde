class Submodular {
  
  int n;
  int[][] setCover;
  
   Submodular(int n) {
    this.n = n;
    getSetCover(); //new int[n][n];
  }
  
   void getSetCover() {
    setCover = new int[n][n];
    
    for (int i = 0; i < this.n; i++) {
      for (int j = 0; j < this.n; j++) {
        this.setCover[i][j] = floor(random(2));
      }
    }
    //print set cover
    printSetCover();
  }
  
   int getSubmodularValuation(Bundle bundle) {
//    //TODO : Maybe return a valuation that is based on a probability or something more generic
//    int tempVal= 0;
//    for (int i = 0; i < setCover.length; i++) {
//      for (int j = 0; j < setCover[0].length; j++) {
//        if (bundle.getTheBundle().get(j) == 1) {
//          if (setCover[i][j] == 1) {
//            tempVal++;
//            j = setCover[0].length + 1; //move to next row
//          }
//        }
//      }
//    }
//    System.out.println("tempVal = " + tempVal);
//    return tempVal;

    int tempVal = 0;
    int[][] sc = setCover;
    Bundle b = bundle;

    for (int row = 0; row < sc.length; row++){
      for (int col = 0; col < sc[0].length; col++){
        if (b.getTheBundle().get(col) == 1){
          if (sc[row][col] == 1){
            tempVal++;
          }
        }
      }
    }

//    System.out.println("tempVal = " + tempVal);
    return tempVal;
  }
  
   void printSetCover() {
    System.out.println("----------- START SET COVER-----------");
    for (int i = 0; i < this.setCover.length; i++) {
      for (int j = 0; j < this.setCover[0].length; j++) {
        System.out.print(this.setCover[i][j]);
      }
      System.out.println();
    }
    System.out.println("----------- END OF SET COVER -----------");
  }
  
}
