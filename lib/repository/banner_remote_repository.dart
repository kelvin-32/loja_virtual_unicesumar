import './../models/banner_model.dart';
import './../services/banner_service.dart';

class BannerRemoteRepository {
  final BannerService bannerService;

  BannerRemoteRepository(this.bannerService);

  Future<List<BannerModel>> fetchBanners() async {
    return await bannerService.fetchBanners();
  }
}
