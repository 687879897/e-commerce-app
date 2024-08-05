class ProductDetailsModel {
  int price;
  String description;
  String name;
  List<String> images;
  double rating;
  int stock;
  String id;

  ProductDetailsModel({
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.rating,
    required this.stock,
    required this.id,
  });
}
