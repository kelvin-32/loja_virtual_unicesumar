import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/product_controller.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/quantity_widget.dart';

class CartPage extends StatelessWidget {
  final cartController = Get.find<CartController>();
  final productController = Get.find<ProductController>();

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sempre recarrega todos os produtos ao abrir o carrinho
    productController.fetchProducts();

    if (productController.carregando.value) {
      return const Center(child: CircularProgressIndicator());
    }
    final theme = Theme.of(context);
    final currencyFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho Gamer'),
      ),
      body: Obx(() {
        final itens = cartController.cartProducts;
        final productList = productController.productList;

        if (itens.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.videogame_asset,
                    size: 60, color: Color(0xFF00FFEA)),
                const SizedBox(height: 16),
                const Text(
                  'Seu Carrinho Gamer está vazio!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Orbitron',
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Adicione jogos ao carrinho para continuar.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  text: 'Continuar comprando',
                  icon: Icons.sports_esports,
                  onPressed: () {
                    Get.offAllNamed('/home');
                  },
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.only(left: 4, top: 6, right: 2, bottom: 6),
                itemCount: itens.length,
                itemBuilder: (context, index) {
                  final item = itens[index];
                  final produto = productList
                      .firstWhereOrNull((p) => p.id == item.productId);
                  if (produto == null) {
                    return const SizedBox(); // Produto não encontrado
                  }

                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
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
                      title: Text(
                        produto.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(currencyFormat.format(produto.price), style: TextStyle(color: Colors.white70)),
                      trailing: QuantityWidget(
                        suffixText: 'Un',
                        value: item.quantity,
                        result: (quantity) {
                          print('Atualizando quantidade: $quantity');
                          cartController.atualizarquantity(
                              item.productId, quantity);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: cartController.limparCarrinho,
                    icon: const Icon(Icons.delete_outline, color: Colors.white),
                    label: const Text(
                      'Limpar Carrinho',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  Obx(() => Text(
                        'Total: ${currencyFormat.format(cartController.total)}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Obx(() => ElevatedButton.icon(
                      icon: const Icon(Icons.check_circle_outline,
                          color: Colors.white),
                      label: cartController.carregandoFinalizar.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Finalizar Pedido',
                              style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () async {
                        final isLogado =
                            Get.find<AuthController>().logado.value;
                        if (!isLogado) {
                          Get.snackbar(
                            'Acesso negado',
                            'Faça login para finalizar a compra de jogos.',
                            colorText: Colors.white,
                            backgroundColor: Theme.of(context).primaryColor,
                            snackPosition: SnackPosition.TOP,
                            margin: const EdgeInsets.all(16),
                            borderRadius: 12,
                            icon: const Icon(Icons.lock_outline,
                                color: Colors.white),
                            duration: const Duration(seconds: 3),
                          );
                          return;
                        }
                        cartController.carregandoFinalizar.value = true;
                        await cartController.finalizarPedido();
                        cartController.clearCartBadge();
                        cartController.carregandoFinalizar.value = false;
                      },
                    )),
              ),
            ),
          ],
        );
      }),
    );
  }
}
