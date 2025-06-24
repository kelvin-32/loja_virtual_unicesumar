import 'package:get/get.dart';
import '../models/product_model.dart';
import '../repository/product_remote_repository.dart';

class ProductController extends GetxController {
  final ProductRemoteRepository productRepository;

  ProductController({required this.productRepository});

  // Lista de produtos observável
  final RxList<ProductModel> productList = <ProductModel>[].obs;

  // Produto atual (caso queira exibir um detalhe)
  final Rx<ProductModel?> selectedProduct = Rx<ProductModel?>(null);

  var carregando = true.obs;
  var erro = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  // Carregar todos os produtos
  Future<void> fetchProducts() async {
    try {
      carregando.value = true;
      erro.value = '';
      productList
          .assignAll(mockGames); // mockGames deve conter todos os produtos
    } catch (e) {
      erro.value = e.toString();
    } finally {
      carregando.value = false;
    }
  }

  // Carregar todos os produtos por categoria
  Future<void> fetchProductsByCategory(String category) async {
    try {
      carregando.value = true;
      erro.value = '';
      
      // Mapeamento de categorias sem acento para categorias com acento
      Map<String, String> categoryMap = {
        'Acessorios': 'Acessórios',
        'Colecionaveis': 'Colecionáveis',
        'Gift Cards': 'Gift Cards',
        'Jogos': 'Jogos',
        'Consoles': 'Consoles'
      };
      
      // Encontra a categoria correta com acentos
      String correctCategory = category;
      categoryMap.forEach((key, value) {
        if (key.toLowerCase() == category.toLowerCase()) {
          correctCategory = value;
        }
      });
      
      // Filtra os produtos mockados pela categoria
      final filtered = mockGames.where((p) => p.category == correctCategory).toList();
      productList.assignAll(filtered);
    } catch (e) {
      erro.value = e.toString();
    } finally {
      carregando.value = false;
    }
  }

  // Carregar um produto pelo id
  Future<void> fetchProductById(int id) async {
    try {
      carregando.value = true;
      erro.value = '';
      final product = await productRepository.fetchProductById(id);
      selectedProduct.value = product;
    } catch (e) {
      erro.value = e.toString();
    } finally {
      carregando.value = false;
    }
  }

  ProductModel? getProdutoById(int id) {
    return productList.firstWhereOrNull((p) => p.id == id);
  }
}
