import 'package:get/get.dart';
import '../views/user/login_page.dart';
import '../views/user/profile_page.dart';
import '../views/cart/cart_page.dart';
import '../views/favorite/favorites_page.dart';
import '../views/order/orders_page.dart';
import '../views/home/category_page.dart';
import '../widgets/main_navigation_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: '/home', page: () => const MainNavigationPage()),
    GetPage(name: '/category/:category', page: () => CategoryPage()),
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/profile', page: () => ProfilePage()),
    GetPage(name: '/cart', page: () => CartPage()),
    GetPage(name: '/favorites', page: () => FavoritesPage()),
    GetPage(name: '/orders', page: () => OrdersPage()),
  ];
}