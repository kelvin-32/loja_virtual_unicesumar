import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../repository/repository.dart';
import 'controllers.dart';

class FavoritosController extends GetxController {
  final FavoritosRepository favoritosRepository;

  FavoritosController({required this.favoritosRepository});

  final RxList<int> favoritos = <int>[].obs;
  final box = GetStorage();

  Future<void> loadFavoritosForUser(int? userId) async {
    if (userId == null) {
      return;
    }

    final favoritosData =
        await favoritosRepository.getFavoritosByUserId(userId);
    favoritos.assignAll(favoritosData.map((fav) => fav['productId'] as int));
  }

  void toggleFavorito(int productId) {
    final userId = Get.find<UserController>().user.value?.id;
    if (userId == null) return;

    if (favoritos.contains(productId)) {
      favoritos.remove(productId);
    } else {
      favoritos.add(productId);
    }
    // Salva favoritos do usuário
    box.write('favoritos_user_$userId', favoritos.toList());
  }

  void removerFavoritoPorId(int productId) {
    final userId = Get.find<UserController>().user.value?.id;
    if (userId == null) return;
    favoritos.remove(productId);
    box.write('favoritos_user_$userId', favoritos.toList());
  }

  bool isFavorito(int productId) {
    return favoritos.contains(productId);
  }

  bool isFavoritoSync(int productId) {
    return favoritos.contains(productId);
  }

  // Renomeado para evitar conflito de nomes
  void removerFavoritoDoRepositorioPorId(int id) async {
    final userId = Get.find<UserController>().user.value?.id;
    if (userId != null) {
      await favoritosRepository.removeFavorito(userId, id);
    }
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
        title: const Text('Favorites'),
      ),
      body: Obx(() {
        if (favoritosController.favoritos.isEmpty) {
          return const Center(
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
                icon: const Icon(Icons.delete),
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
