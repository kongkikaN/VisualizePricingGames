class App {
  /**
   * Create Global Variables
   */

  int n;            //number of sellers
  Buyer buyer;        //the Buyer(id, type, n, sellers[])
  ArrayList<Seller> sellers;  //ArrayList of the sellers that participate in the game
  
   App(int n, Buyer buyer, ArrayList<Seller> sellers) {
    this.n = n;
    this.buyer = buyer;
    this.sellers = sellers;
  }
  
   void askForValuation() {
    Bundle bundle = new Bundle(n);
    //CREATE RANDOM BUNDLE FOR TESTING
    //Random r = new Random();
    for (int i = 0; i < n; i++) {
      Byte k = 1;
      bundle.getTheBundle().set(i,k);
    }
    
    buyer.getUtility(bundle);
  }
  /*
   * this is a variation of the Lehmann - Lehmann - Nissan 2-approx algorithm
   */
   Bundle getLLN() {

    //create a bundle of n items
    Bundle currentBundle = new Bundle(n);    //n : items, ArrayList of n Byte items, all are set to "0"
    
    for (int i = 0; i < n; i++) {
      //At first calculate the bundle that maximizes buyers utility
      currentBundle = getNextBundleWithMaxUtil(currentBundle);
//      System.out.println( "i ====================== "+i);
    }

    return currentBundle;
  }
  
   Bundle getNextBundleWithMaxUtil(Bundle currentBundle) {
//    System.out.println("------------------------------------");
//    System.out.println(currentBundle.getTheBundle());

        //calculate current utility
    int currentUtility = this.buyer.getUtility(currentBundle);

    //create a Bundle object (same bundle as the current one) and suppose this maximizes buyers util
    Bundle maxUtilBundle = new Bundle(currentBundle);

    //create an arraylist of Byte items -> this is going to eventually store the maxUtilBundle
    ArrayList<Byte> b = new ArrayList<Byte>();

    for (int i = 0; i < this.n; i++) {
        //for each item in the bundle, if the buyer doesn't buy it
      if (maxUtilBundle.getTheBundle().get(i) == 0) {
          //check if he bought the item, would it increase his utility?
        maxUtilBundle.getTheBundle().set(i, (byte) 1);
        int nextUtil = this.buyer.getUtility(maxUtilBundle);
        //if it does increase his utility (that means his -to become- utility is higher than his current utility)
        if (nextUtil >= currentUtility) {
          currentUtility = nextUtil;
          b.clear();
          for (int k = 0; k < this.n; k++) {
            b.add(maxUtilBundle.getTheBundle().get(k));
          }
          maxUtilBundle.getTheBundle().set(i, (byte) 0);
        } else {
          maxUtilBundle.getTheBundle().set(i, (byte) 0);
        }
      }
    }

    if (b.isEmpty()) {
      b = maxUtilBundle.getTheBundle();
    }

    Bundle bestBundle = new Bundle(this.n, b);
//    System  .out.println("the best utility is = " + this.buyer.getUtility(bestBundle));
//    System.out.println("BUNDLE RETURNED IS");
//    System.out.println(bestBundle.getTheBundle());
    return bestBundle;
  }

   void setNewPrices(Bundle currentBundle, ArrayList<Seller> sellers, int iteration){
    //bundle that is currently prefered
    ArrayList b = currentBundle.getTheBundle();
    //select a seller
    Seller s = sellers.get(iteration%sellers.size());
    //System.out.println("Sellers price with id = " + s.getId() + " is : " + s.getPrice());
    int currentPrice = s.getPrice();
    if ((Byte) b.get(s.getId()) == 1){
      s.setPrice(currentPrice + 1);
      //System.out.println("Sellers price with id = " + s.getId() + " CHANGED TO : " + s.getPrice()); 
      currentBundle = getLLN();
      if (currentBundle.getTheBundle().get(s.id) == 0){
        s.setPrice(currentPrice - 1);
      }
    }
    else{
      s.setPrice(currentPrice - 1);
    }
  }
  
  void setNewPrices2(Bundle currentBundle, ArrayList<Seller> sellers, int iteration){
    
  }
}
