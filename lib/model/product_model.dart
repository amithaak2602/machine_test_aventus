class ProductModel {
  final String? name;
  final String? id;
  final String? image;
  final String? price;
  final String? description;
  ProductModel({
    this.name,
    this.id,
    this.image,
    this.price,
    this.description,
  });
  factory ProductModel.fromJson(Map<String, dynamic> doc) {
    return ProductModel(
      id: doc['id'],
      price: doc["price"] ?? "",
      name: doc["name"] ?? "",
      image: doc["image"] ?? "",
      description: doc['description']??""
    );
  }
}
