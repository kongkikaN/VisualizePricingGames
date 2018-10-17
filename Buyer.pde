class Buyer {
  
  int id;              //id of buyer (in case we create more buyers in the future)
  int type;            //type of buyer (Submodular, Single minded etc)
  int n;              //#Sellers he is facing
  ArrayList<Seller> sellers;    //The sellers
  Bundle preferedBundle;      //The bundle that currently maximizes his utility given the current prices
  Submodular1 submodular;      //Valuation class -> Submodular
  
  
   Buyer(int id, int type, int n, ArrayList<Seller> sellers) {
    this.id = id;
    this.type = type;
    this.n = n;
    this.sellers = sellers;
    this.submodular = new Submodular1(n);
    this.preferedBundle = new Bundle(n);
  }
  
  
   int getId() {
    return id;
  }


   void setId(int id) {
    this.id = id;
  }


   int getType() {
    return type;
  }


   void setType(int type) {
    this.type = type;
  }


   int getN() {
    return n;
  }


   void setN(int n) {
    this.n = n;
  }


   ArrayList<Seller> getSellers() {
    return sellers;
  }


   void setSellers(ArrayList<Seller> sellers) {
    this.sellers = sellers;
  }


   Bundle getPreferedBundle() {
    return preferedBundle;
  }


   void setPreferedBundle(Bundle preferedBundle) {
    this.preferedBundle = preferedBundle;
  }


   Submodular1 getSubmodular() {
    return submodular;
  }


   void setSubmodular(Submodular1 submodular) {
    this.submodular = submodular;
  }


   int getValuation(Bundle bundle) {
    //calculate valuation
    int valuation = 0;
    
    //if type == 0, buyer is submodular
    if (this.type == 0) {
      //get submodular valuation
      valuation = this.submodular.getSubmodularValuation(bundle);
      
    }
//    System.out.println("---------- START OF VALUATION ----------");
//    System.out.print("valuation for bundle : ");
//    System.out.print(bundle.getTheBundle());
//    System.out.println(" is : " + valuation);
//    System.out.println("---------- END OF VALUATION ------------");
    return valuation;
    
  }
  
   int getUtility(Bundle bundle) {
    
    int valuation = getValuation(bundle);      //get valuation for some bundle
    int price = 0;
    for (int i = 0; i < n; i++) {
      price += bundle.getTheBundle().get(i) * this.sellers.get(i).getPrice();
    }
    int utility = valuation - price;
//    System.out.println("---------- START OF UTILITY -----------");
//    System.out.println("utility : " + utility);
//    System.out.println("----------- END OF UTILITY ------------");
    
    return utility;
  }
}
