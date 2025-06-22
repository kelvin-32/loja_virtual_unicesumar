import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './../controllers/controllers.dart';
import './../views/views.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  final MainNavigationController navigationController =
      Get.put(MainNavigationController());
  final CartController cartController = Get.find<CartController>();
  final GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey widgetKey) runAddToCartAnimation;

  final List<Widget> _pages = [
    const HomePage(),
    OrdersPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  void itemSelectedCartAnimations(GlobalKey gkImage) async {
    await runAddToCartAnimation(gkImage);
    await cartController.cartKey?.currentState
        ?.runCartAnimation(cartController.totalQuantity.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(navigationController.selectedIndex.value == 0
            ? 'Loja de Games'
            : navigationController.selectedIndex.value == 1
                ? 'Meus Pedidos'
                : navigationController.selectedIndex.value == 2
                    ? 'Meus Favoritos'
                    : 'Meu Perfil')),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/cart');
            },
            child: AddToCartIcon(
              key: cartKey,
              icon: const Icon(Icons.shopping_cart),
              badgeOptions: const BadgeOptions(
                active: true,
                backgroundColor: Colors.purple,
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () {
          navigationController.totalPages = _pages.length;
          return _pages[navigationController.selectedIndex.value];
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: navigationController.selectedIndex.value,
          onTap: navigationController.changePage,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Games'),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long), label: 'Pedidos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favoritos'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ),
      ),
    );
  }
}
