import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/favoritos_controller.dart';
import '../../controllers/product_controller.dart';
import '../../models/product_model.dart'; // já importa o mockGames

class FavoritesPage extends StatelessWidget {
  final favoritosController = Get.find<FavoritosController>();

  FavoritesPage({super.key});

  // Função para buscar o produto pelo ID
  ProductModel? buscarProdutoPorId(int id) {
    final productList = Get.find<ProductController>().productList;
    return productList.firstWhereOrNull((p) => p.id == id);
  }

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    if (productController.carregando.value) {
      return const Center(child: CircularProgressIndicator());
    }

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Jogos Favoritos'),
      ),
      body: Obx(() {
        final favoritos = favoritosController.favoritos;
        if (favoritos.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite_border, size: 60, color: Color(0xFF00FFEA)),
                SizedBox(height: 12),
                Text(
                  'Nenhum favorito encontrado',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Orbitron',
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Adicione jogos aos seus favoritos\npara visualizá-los aqui.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: favoritos.length,
          itemBuilder: (context, index) {
            final produto = buscarProdutoPorId(favoritos[index]);
            if (produto == null) {
              return const SizedBox(); // Produto não encontrado
            }

            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  produto.image,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                ),
              ),
              title: Text(produto.title, style: TextStyle(color: Colors.white)),
              subtitle: Text('R\$ ${produto.price.toStringAsFixed(2)}', style: TextStyle(color: Colors.white70)),
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  favoritosController.removerFavoritoPorId(
                      produto.id); // Use o nome correto do método
                  Get.snackbar(
                    'Removido',
                    '${produto.title} removido dos favoritos.',
                    colorText: Colors.white,
                    backgroundColor: theme.primaryColor,
                    snackPosition: SnackPosition.TOP,
                    margin: const EdgeInsets.all(16),
                    borderRadius: 12,
                    icon:
                        const Icon(Icons.favorite_border, color: Colors.white),
                    duration: const Duration(seconds: 2),
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}