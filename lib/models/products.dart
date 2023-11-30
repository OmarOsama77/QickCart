class Products {
  int id;
  String gender;
  String imageUrl;
  String name;
  num price;
  String weight;
  bool? fav;

  Products(
      {
      required this.id,
      required this.gender,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.weight,
      this.fav});
}
