class Bundle {
  ArrayList<Byte> theBundle;
  int n;
  
   Bundle(int n) {
    this.n = n;
    this.theBundle = new ArrayList<Byte>();
    initBundle();
  }
  
   Bundle(Bundle bundle) {
    this.n = bundle.getN();
    this.theBundle = bundle.getTheBundle();
  }
  
   Bundle(int n, ArrayList<Byte> theBundle) {
    this.n = n;
    this.theBundle = theBundle;
  }
  
  /*
   * initialize an empty bundle
   */
  
   int getN() {
    return n;
  }



   void initBundle() {
    for(int i = 0; i < this.n; i++) {
      this.theBundle.add((byte) 0);
    }
  }

   void setN(int n) {
    this.n = n;
  }

   void clearBundle() {
    this.theBundle.clear();
    initBundle();
  }
  
   ArrayList<Byte> getTheBundle() {
    return this.theBundle;
  }

   void setTheBundle(ArrayList<Byte> theBundle) {
    this.theBundle = theBundle;
  }
  
   void fillBundle() {
    for (int i = 0; i < this.n; i++) {
      this.theBundle.set(i, (byte) 1);
    }
  }
  
   void setSymmetricBundle(Bundle arr) {
    for (int i = 0; i < arr.getTheBundle().size(); i++) {
      if (arr.getTheBundle().get(i) == 0) {
        this.theBundle.set(i,(byte) 1);
      }
      else {
        this.theBundle.set(i, (byte) 0);
      }
    }
  }
  
   void setEmptyBundle() {
    for (int i = 0; i < this.n; i++) {
      this.theBundle.set(i, (byte) 0);
    }
  }
  
}
