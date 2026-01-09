



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

  DeliveryEntity(
      {required this.deliveryName,
      required this.deliveryStatus,
      required this.deliveryRate});
}
