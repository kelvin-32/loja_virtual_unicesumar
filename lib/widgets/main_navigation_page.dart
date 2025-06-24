import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './../controllers/controllers.dart';
import './../views/views.dart';
import './../views/favorite/favorites_page.dart' as favorite_view;

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
    favorite_view.FavoritesPage(),
    ProfilePage(),
  ];

  void itemSelectedCartAnimations(GlobalKey gkImage) async {
    await runAddToCartAnimation(gkImage);
    await cartController.cartKey?.currentState
        ?.runCartAnimation(cartController.totalQuantity.toString());
  }

  @override
  void initState() {
    super.initState();
    cartController.setCartKey(cartKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(navigationController.selectedIndex.value == 0
            ? 'Dark Games'
            : navigationController.selectedIndex.value == 1
                ? 'Meus Pedidos'
                : navigationController.selectedIndex.value == 2
                    ? 'Meus Favoritos'
                    : 'Meu Perfil')),
        actions: [
          Obx(() => Stack(
                alignment: Alignment.topRight,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart,
                        color: Color(0xFF00FFEA)),
                    onPressed: () => Get.toNamed('/cart'),
                  ),
                  if (cartController.totalQuantity > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Text(
                          cartController.totalQuantity.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              )),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Carrinho Gamer'), // Alterado aqui!
          ],
        ),
      ),
    );
  }
}
