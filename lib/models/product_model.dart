class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imagePath; // asset yolu

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}
