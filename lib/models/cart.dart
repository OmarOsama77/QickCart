
class Cart{
  String? id;
  Set<int>? items;
  num? price;
  bool? ordered;
  Cart({this.id, this.items, this.price,this.ordered});

  Map<String,dynamic>toJson(){
    return {
      "id":id,
      "items":items,
      "price":price,
      "ordered":ordered
    };
  }
}