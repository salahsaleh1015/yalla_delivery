



import 'package:hive/hive.dart';
part 'delivery_entity.g.dart';




@HiveType(typeId: 4)
class DeliveryEntity {
  @HiveField(0)
  final String deliveryName;
  @HiveField(1)
  final String deliveryStatus;
  @HiveField(2)
  final int deliveryRate;
  @HiveField(3)
  final String deliveryImage;


  DeliveryEntity(
      {required this.deliveryName,
      required this.deliveryStatus,
      required this.deliveryRate,
        required this.deliveryImage});
}
