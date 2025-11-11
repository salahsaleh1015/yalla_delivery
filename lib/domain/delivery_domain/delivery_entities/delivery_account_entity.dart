


import 'package:hive/hive.dart';

part 'delivery_account_entity.g.dart';

@HiveType(typeId: 1)
class DeliveryInfoEntity {
  @HiveField(0)
  final String deliveryName;
  @HiveField(1)
  final String deliveryPhone;
  @HiveField(2)
  final String deliveryLocation;
  @HiveField(3)
  final String deliveryMail;
  @HiveField(4)
  final String deliveryStatus;



  DeliveryInfoEntity(
      {required this.deliveryName,
      required this.deliveryPhone,
      required this.deliveryLocation,
      required this.deliveryMail,
      required this.deliveryStatus
      });
}
