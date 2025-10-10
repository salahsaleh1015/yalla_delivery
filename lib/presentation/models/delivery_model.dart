import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveryModel {
  DeliveryModel(
      {required this.deliveryMail,
      required this.deliveryPassword,
      this.deliveryId,
      required this.deliveryName,
      required this.deliveryPhone,
      required this.deliveryLocation,
      required this.deliveryStatus,
      required this.deliveryRate});

  final String? deliveryId;
  final String deliveryName;
  final String deliveryPhone;
  final String deliveryLocation;
  final String deliveryStatus;
  final int deliveryRate;
  final String deliveryMail;
  final String deliveryPassword;

  factory DeliveryModel.fromJson(DocumentSnapshot  json){
    final data = json.data() as Map<String, dynamic>;
    return DeliveryModel(
      deliveryMail: data['deliveryMail'],
      deliveryPassword: data['deliveryPassword'],
      deliveryId: data['deliveryId'],
      deliveryName: data['deliveryName'],
      deliveryPhone: data['deliveryPhone'],
      deliveryLocation: data['deliveryLocation'],
      deliveryStatus: data['deliveryStatus'],
      deliveryRate: data['deliveryRate'],
    );
  }

  Map<String, dynamic> toJson() => {
        'deliveryId': deliveryId,
        'deliveryName': deliveryName,
        'deliveryPhone': deliveryPhone,
        'deliveryLocation': deliveryLocation,
        'deliveryStatus': deliveryStatus,
        'deliveryRate': deliveryRate,
        'deliveryMail': deliveryMail,
        'deliveryPassword': deliveryPassword
      };
}
