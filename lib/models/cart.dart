
class Cart{
  List<Map<String,num>>? items;
  num? price;
  bool? ordered;
  Cart({ this.items, this.price,this.ordered});

  Map<String,dynamic>toJson(){
    return {
      "items":items,
      "price":price,
      "ordered":ordered
    };
  }
}