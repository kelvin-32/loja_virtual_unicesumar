import './../database/app_database.dart';
import './../models/models.dart';
import './repository.dart';

class CartRepository {
  final CartLocalRepository cartLocalRepository;
  final CartProductsLocalRepository cartProductsLocalRepository;

  CartRepository(this.cartLocalRepository, this.cartProductsLocalRepository);

  Future<int> saveCart(int userId, String date) async {
    return await cartLocalRepository.saveCart(userId, date);
  }

  Future<void> removeCartProduct(int cartId, int productId) async {
    return await cartLocalRepository.removeCartProduct(cartId, productId);
  }

  Future<void> saveCartProduct(int cartId, CartProductModel cartProduct) async {
    await cartProductsLocalRepository.saveCartProduct(cartId, cartProduct);
  }

  Future<CartModel?> getCartById(int cartId) async {
    return await cartLocalRepository.getCartById(cartId);
  }

  Future<List<CartProductModel>> getCartProducts(int cartId) async {
    return await cartProductsLocalRepository.getCartProducts(cartId);
  }

  Future<void> deleteCart(int cartId) async {
    await cartProductsLocalRepository.deleteCartProducts(cartId);
    await cartLocalRepository.deleteCart(cartId);
  }

  Future<CartModel?> getCartByUserId(int userId) async {
    final db = await AppDatabase().database;
    final maps = await db.query(
      'cart',
      where: 'userId = ?',
      whereArgs: [userId],
      orderBy: 'id DESC',
      limit: 1,
    );
    if (maps.isNotEmpty) {
      final cartMap = maps.first;
      final productMaps = await db.query(
        'cart_products',
        where: 'cartId = ?',
        whereArgs: [cartMap['id']],
      );
      final products =
          productMaps.map((map) => CartProductModel.fromJson(map)).toList();

      final dateString = cartMap['date']?.toString() ?? '';
      final date = dateString.isNotEmpty
          ? DateTime.tryParse(dateString) ?? DateTime.now()
          : DateTime.now();

      return CartModel(
        id: cartMap['id'] as int,
        userId: cartMap['userId'] as int,
        date: date,
        products: products,
      );
    }
    return null;
  }
}
