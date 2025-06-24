import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './../../controllers/controllers.dart';
import './../../widgets/widgets.dart';
import './../../views/views.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cartController = Get.find<CartController>();
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Banners
              BannerCarousel(banners: controller.banners),

              const SizedBox(height: 16),

              /// Categorias
              const Center(
                child: Text(
                  'Categorias',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: SizedBox(
                  height: 35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      final categoria = controller.categories[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: CategoryTile(
                          category: categoria,
                          onTap: () {
                            // Usando uma abordagem mais segura para codificar a URL
                            final encodedCategory = Uri.encodeComponent(categoria)
                                .replaceAll('%C3%B3', 'o')  // ó
                                .replaceAll('%C3%A1', 'a')  // á
                                .replaceAll('%C3%A9', 'e')  // é
                                .replaceAll('%C3%AD', 'i')  // í
                                .replaceAll('%C3%BA', 'u'); // ú
                            Get.toNamed('/category/$encodedCategory');
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// Produtos em destaque
              const Text(
                'Produtos em destaque',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.featuredProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = controller.featuredProducts[index];
                  return ProductCard(
                    product: product,
                    cartAnimationMethod: (imageKey) {
                      cartController.itemSelectedCartAnimations(imageKey);
                    },
                    onTap: () {
                      Get.to(() => ProductDetailPage(product: product));
                    },
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
