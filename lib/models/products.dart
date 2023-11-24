class Products {
  int id;
  String gender;
  String image_url;
  String name;
  num price;
  int? productId;
  String weight;

  Products(
      {
          this.productId,
        required this.id,
      required this.gender,
      required this.image_url,
      required this.name,
      required this.price,
      required this.weight,
  });
}
