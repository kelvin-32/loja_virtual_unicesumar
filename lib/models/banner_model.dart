import './../models/models.dart';

class BannerModel {
  final int id;
  final String imageUrl;
  final String title;
  final double price;

  BannerModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  factory BannerModel.fromProduct(ProductModel product) {
    return BannerModel(
      id: product.id,
      title: product.title,
      price: product.price,
      imageUrl: product.image,
    );
  }

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}

// Exemplo de banners mockados
final List<BannerModel> mockBanners = [
  BannerModel(
    id: 4,
    imageUrl:
        'https://wafuu.com/cdn/shop/products/nintendo-switch-the-legend-of-zelda-tears-of-the-kingdom-950413.jpg?v=1706144130',
    title: 'The Legend of Zelda: Tears of the Kingdom',
    price: 349.90,
  ),
  BannerModel(
    id: 1,
    imageUrl:
        'https://cdn.awsli.com.br/600x450/51/51695/produto/42713594/3cfc3dfa30.jpg',
    title: 'The Last of Us Part II',
    price: 199.90,
  ),
  BannerModel(
    id: 5,
    imageUrl: 'https://imgs.casasbahia.com.br/1569668001/4xg.jpg?imwidth=500',
    title: 'PlayStation 5',
    price: 4499.99,
  ),
  BannerModel(
    id: 3,
    imageUrl:
        'https://cdn.awsli.com.br/300x300/2395/2395453/produto/306748564/4979f11b66c4bdae90ff68636840e122-9u02t2d6s7.jpg',
    title: 'FIFA 24',
    price: 299.90,
  ),
];