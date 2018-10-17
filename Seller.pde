class Seller {
  int id;
  int price;
  int utility;
  
   Seller(int id, int price) {
    this.id = id;
    this.price = setRandomPrice();
  }
  
   int setAllZero(){
    return 0;
  }
  
   int allZeroExceptFirstSeller(){
    if (this.id == 0){
      return 1;
    }
    else {
      return 0;
    }
  }

   int setRandomPrice(){
    //Random r = new Random(15);
    return floor(random(15));
  }

   int setPriceForDebug(){
    if (this.id%2 == 0){
      return 100;
    }
    else {
      return 0;
    }
  }

   int getId() {
    return id;
  }

   void setId(int id) {
    this.id = id;
  }

   int getPrice() {
    return price;
  }

   void setPrice(int price) {
    this.price = price;
  }

   int getUtility() {
    return utility;
  }

   void setUtility(int utility) {
    this.utility = utility;
  }
}
