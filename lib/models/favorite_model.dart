import 'package:hive/hive.dart';

part 'favorite_model.g.dart';

@HiveType(typeId: 0)
class FavoriteModel {
  @HiveField(0)
  final int userId;
  @HiveField(1)
  final int productId;

  FavoriteModel({required this.userId, required this.productId});
}
