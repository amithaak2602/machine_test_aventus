class CartModel {
  final String? name;
  final String? id;
  final String? image;
  final double? price;
  final double? total;
  final String? description;
  final String? productId;
  final int? cartCount;
  final List<CartModel>? cartList;
  final CartModel? cartModel;

  CartModel({
    this.name,
    this.id,
    this.image,
    this.price,
    this.description,
    this.productId,
    this.cartCount,
    this.cartList,
    this.cartModel,
    this.total,
  });
  factory CartModel.fromJson(Map<String, dynamic> doc) {
    return CartModel(
        id: doc['id'],
        price: doc["price"],
        name: doc["name"] ?? "",
        image: doc["image"] ?? "",
        description: doc['description'] ?? "",
        productId: doc['productId'],
        cartCount: doc['count'] ?? 0,
        total: (doc["grandTotal"] ?? 0));
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "name": name,
        "image": image,
        "description": description,
        "count": cartCount,
        "productId": productId,
        "grandTotal": total
      };
  CartModel copyWith(
      {String? name,
      double? price,
      double? total,
      String? id,
      String? image,
      String? description,
      int? cartCount,
      String? productId,
      List<CartModel>? cartList,
      CartModel? cartModel}) {
    return CartModel(
      name: name ?? this.name,
      price: price ?? this.price,
      id: id ?? this.id,
      image: image ?? this.image,
      cartCount: cartCount ?? this.cartCount,
      productId: productId ?? this.productId,
      cartList: cartList ?? this.cartList,
      cartModel: cartModel ?? this.cartModel,
      total: total ?? this.total,
    );
  }

  CartModel calcTotal() {
    double grandTotal = 0;
    int qty = 0;
    grandTotal = (price ?? 0) * (cartCount ?? 0);
    print(grandTotal);
    // qty =
    //     (cartList ?? []).fold(0, (p, e) => p + (int.parse(e.price.toString())));
    return copyWith(
      total: grandTotal,
    );
  }
}
