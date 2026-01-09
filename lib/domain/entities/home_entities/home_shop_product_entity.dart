import 'package:hive_flutter/hive_flutter.dart';

part 'home_shop_product_entity.g.dart';

@HiveType(typeId: 3)
class HomeShopProductEntity {
  @HiveField(0)
  final String productId;
  @HiveField(1)
  final String productName;
  @HiveField(2)
  final String productImage;
  @HiveField(3)
  final num productPrice;
  @HiveField(4)
  final String productDescription;


  HomeShopProductEntity(
      {required this.productId,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.productDescription});
}
