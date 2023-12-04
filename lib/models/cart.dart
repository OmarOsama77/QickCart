
class Cart{
  List<Map<String,dynamic>>? items;
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
  factory Cart.fromJson(Map<String,dynamic>json){
    print('aa ${json}');
    final List<Map<String,dynamic>> items = [];
    for (var element in (json['items'] as List<dynamic>)) {

      items.add(element);
    }
    return Cart(
      ordered: json["ordered"],
      price: json["price"],
      items: items
    );
  }
}