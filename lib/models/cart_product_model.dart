import 'package:hive/hive.dart';

part 'cart_product_model.g.dart';

@HiveType(typeId: 3)
class CartProductModel extends HiveObject {
  @HiveField(0)
  final int productId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final int quantity;

  CartProductModel({
    required this.productId,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      productId: json['productId'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'title': title,
        'price': price,
        'imageUrl': imageUrl,
        'quantity': quantity,
      };
}
