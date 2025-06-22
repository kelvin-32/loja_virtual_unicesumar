import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../repository/repository.dart';
import 'controllers.dart';

class FavoritosController extends GetxController {
  final FavoritosRepository favoritosRepository;

  FavoritosController({required this.favoritosRepository});

  final RxList<int> favoritos = <int>[].obs;

  Future<void> loadFavoritosForUser(int? userId) async {
    if (userId == null) {
      return;
    }

    final favoritosData =
        await favoritosRepository.getFavoritosByUserId(userId);
    favoritos.assignAll(favoritosData.map((fav) => fav['productId'] as int));
  }

  Future<void> toggleFavorito(int productId) async {
    final userId = Get.find<UserController>().user.value?.id;

    if (userId == null) {
      return;
    }

    if (favoritos.contains(productId)) {
      await favoritosRepository.removeFavorito(userId, productId);
      favoritos.remove(productId);
    } else {
      await favoritosRepository.addFavorito(
        userId,
        productId,
        DateTime.now().toIso8601String(),
      );
      favoritos.add(productId);
    }
  }

  bool isFavorito(int productId) {
    return favoritos.contains(productId);
  }

  bool isFavoritoSync(int productId) {
    return favoritos.contains(productId);
  }

  void removerFavoritoPorId(int id) {
    favoritos.remove(id);
  }
}

class FavoritesPage extends StatelessWidget {
  final favoritosController = Get.find<FavoritosController>();

  FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Obx(() {
        if (favoritosController.favoritos.isEmpty) {
          return Center(
            child: Text('No favorites yet.'),
          );
        }

        return ListView.builder(
          itemCount: favoritosController.favoritos.length,
          itemBuilder: (context, index) {
            final productId = favoritosController.favoritos[index];
            // Replace with your product widget
            return ListTile(
              title: Text('Product $productId'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  favoritosController.toggleFavorito(productId);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
