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
    id: 101,
    imageUrl:
        'https://wafuu.com/cdn/shop/products/nintendo-switch-the-legend-of-zelda-tears-of-the-kingdom-950413.jpg?v=1706144130',
    title: 'The Legend of Zelda: Tears of the Kingdom (Switch)',
    price: 349.90,
  ),
  BannerModel(
    id: 102,
    imageUrl:
        'https://http2.mlstatic.com/D_NQ_NP_709608-MLU78003402703_072024-O.webp',
    title: 'God of War Ragnarok (PS5) - Mídia Física',
    price: 299.90,
  ),
  BannerModel(
    id: 103,
    imageUrl:
        'https://down-br.img.susercontent.com/file/2cf48df41ad2d68719929499bcf4b26d',
    title: 'Forza Horizon 5 (Xbox Series) - Mídia Física',
    price: 279.90,
  ),
  BannerModel(
    id: 104,
    imageUrl:
        'https://http2.mlstatic.com/D_NQ_NP_735385-MLA81311846598_122024-O.webp',
    title: 'Spider-Man: Miles Morales (PS5) - Mídia Física',
    price: 259.90,
  ),
];
