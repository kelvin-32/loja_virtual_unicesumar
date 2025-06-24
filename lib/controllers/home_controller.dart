import 'package:get/get.dart';

import './../repository/repository.dart';
import './../models/models.dart';

class HomeController extends GetxController {
  final BannerRepository bannerRepository;
  final CategoryRepository categoryRepository;
  final ProductRepository productRepository;

  HomeController({
    required this.bannerRepository,
    required this.categoryRepository,
    required this.productRepository,
  });

  final banners = <BannerModel>[].obs;
  final categories = <String>[].obs;
  final featuredProducts = <ProductModel>[].obs;

  final isLoading = false.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      /// Banners
      final bannersApi = await bannerRepository.getBanners();
      banners.assignAll(bannersApi);

      /// Categories
      final categoriesApi = await categoryRepository.fetchCategories();
      categories.assignAll(categoriesApi);

      /// Featured Products
      final productsApi = await productRepository.fetchProducts();
      final bannerProductIds = bannersApi.map((banner) => banner.id).toSet();
      final bannerProducts = productsApi.where((product) => bannerProductIds.contains(product.id)).toList();
      final otherProducts = productsApi.where((product) => !bannerProductIds.contains(product.id)).toList();
      final combinedProducts = [...bannerProducts, ...otherProducts];
      featuredProducts.assignAll(combinedProducts.take(30).toList());
    } catch (e) {
      errorMessage.value = 'Erro ao carregar a Home: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
