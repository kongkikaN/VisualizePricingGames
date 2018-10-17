
  /**
   * this is a 2-approximation algorithm based on the "Lehmann-Lehmann-Nisan algorithm
   * <b>Important</b> this algorithm is a 2-approximation to the optimal one iff vi are Submodular Valuations
   * @param args
   */
 int n;
 App game;
 Buyer buyer;
 ArrayList<Seller> sellers;
 int k = 1;
 
 int y = 200;
 int w = 100;
 int h = 100;
 int offset = 100;

  void setup() {
    //int n = in.nextInt();
    n = 8;
    frameRate(n);
    size(900, 400);
    
    //Scanner in = new Scanner(System.in);
    
    System.out.println("Enter number of Sellers (= number of items)");
    
    sellers = new ArrayList<Seller>();

    /*
     * create n sellers
     * each seller has an id and starting price
     */

    for (int i = 0; i < n; i++) {
      sellers.add(new Seller(i, 0));
    }

    /*
     * create buyer with id = 0, type = 0, n = number of sellers (=items), all sellers he is facing
     */
    buyer = new Buyer(0, 0, n, sellers);

    //create a game - the App class represents the game that is set
    game = new App(n, buyer, sellers);

    //game.askForValuation();
//    Bundle currentBundle = game.getLLN();

//    System.out.println("--------- best huristic bundle ----------");
//    System.out.println(currentBundle.getTheBundle());
//    System.out.println("Utility of best huristic bundle is = " + buyer.getUtility(currentBundle));
//    System.out.println("------ end of best huristic bundle ------");
//    game.setNewPrices(currentBundle);    //this function is going to be a simplified newPrices version
    
  }
  
  void draw(){
    background(0);
    Bundle currentBundle = game.getLLN();
    game.setNewPrices(currentBundle, sellers, k);
    //System.out.println("--------- best huristic bundle ----------");
    //System.out.println(currentBundle.getTheBundle());
    //System.out.println("Utility of best huristic bundle is = " + buyer.getUtility(currentBundle));
    //System.out.println("------ end of best huristic bundle ------");
    k++;
    
    for (int i = 1; i < n + 1; i++){
      Seller sl = sellers.get(i-1);
      if (currentBundle.getTheBundle().get(i-1) == 1){
        fill(0, 255, 0);
      }
      else{
        fill(255, 0, 0);
      }
      
      int x = i * 100;
      ellipse(x, y, w, h);
      fill(255);
      text("Price:" + sl.getPrice(), x-25, 100 - sl.getPrice() * 8);  // Draw text on baseline
      text("Subm Val:", x - 25, 200);
    }
    text("Buyers Utility :" + buyer.getUtility(currentBundle), 30, 30);
    
    
  }
