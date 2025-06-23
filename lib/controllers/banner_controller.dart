import 'package:get/get.dart';
import '../models/banner_model.dart';
import '../services/banner_service.dart';

class BannerController extends GetxController {
  final BannerService bannerService;

  BannerController({required this.bannerService});

  // Lista de banners observável
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  var carregando = true.obs;
  var erro = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  // Carregar banners
  Future<void> fetchBanners() async {
    try {
      carregando.value = true;
      erro.value = '';
      final result = await bannerService.fetchBanners();
      banners.assignAll(result);
    } catch (e) {
      erro.value = e.toString();
    } finally {
      carregando.value = false;
    }
  }
}
