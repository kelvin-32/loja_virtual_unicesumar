import '../models/banner_model.dart';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });
}

class CartProductModel {
  final ProductModel product;
  final int quantity;

  CartProductModel({
    required this.product,
    required this.quantity,
  });
}

class BannerService {
  Future<List<BannerModel>> fetchBanners() async {
    // Retorna os banners mockados de jogos físicos
    return mockBanners;
  }
}
