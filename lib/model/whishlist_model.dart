class WishListModel {
  final String? name;
  final String? id;
  final String? image;
  final String? price;
  final String? description;
  final String? productId;
  final String? cartCount;
  final List<WishListModel>? wishList;
  WishListModel({
    this.name,
    this.id,
    this.image,
    this.price,
    this.description,
    this.productId,
    this.cartCount,
    this.wishList,
  });
  factory WishListModel.fromJson(Map<String, dynamic> doc) {
    return WishListModel(
        id: doc['id'],
        price: doc["price"] ?? "",
        name: doc["name"] ?? "",
        image: doc["image"] ?? "",
        productId: doc['productId'] ?? "",
        description: doc['description'] ?? "");
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "name": name,
        "image": image,
        "description": description,
        "productId": productId,
      };

  WishListModel copyWith({
    String? name,
    String? price,
    double? total,
    String? id,
    String? image,
    String? description,
    String? cartCount,
    String? productId,
    List<WishListModel>? wishList,
  }) {
    return WishListModel(
      name: name ?? this.name,
      price: price ?? this.price,
      id: id ?? this.id,
      image: image ?? this.image,
      cartCount: cartCount ?? this.cartCount,
      productId: productId ?? this.productId,
      wishList: wishList ?? this.wishList,
    );
  }
}
