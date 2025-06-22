import '../models/product_model.dart';

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
}

class BannerService {
  Future<List<BannerModel>> fetchBanners() async {
    // Simula banners com jogos em destaque
    final banners = mockGames.take(4).map((game) {
      return BannerModel(
        id: game.id,
        imageUrl: game.image,
        title: game.title,
        price: game.price,
      );
    }).toList();
    return banners;
  }
}

class CartProductModel {
  final ProductModel product;
  final int quantity;

  CartProductModel({
    required this.product,
    required this.quantity,
  });
}
