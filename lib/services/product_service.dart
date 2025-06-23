import '../models/product_model.dart';

class ProductService {
  Future<List<ProductModel>> fetchProducts() async {
    return mockGames;
  }

  Future<List<ProductModel>> fetchProductsByCategory(String category) async {
    return mockGames.where((p) => p.category == category).toList();
  }

  Future<ProductModel> fetchProductById(int id) async {
    return mockGames.firstWhere((p) => p.id == id);
  }
}
