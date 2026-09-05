import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/core/resources/assets_manager.dart';
import 'package:delivery_app/domain/entities/delivery_management_entities/delivery_entity.dart';

class DeliveryModel extends DeliveryEntity {
  String? id;
  String? name;
  String? phone;
  String? location;
  String? status;
  int? rate;
  String? mail;
  String? password;
  String? image;

  DeliveryModel(
      {this.mail,
      this.password,
      this.id,
      this.name,
      this.phone,
      this.location,
      this.status,
      this.image,
      this.rate})
      : super(
            deliveryName: name ?? 'لا توجد بيانات',
            deliveryStatus: status ?? 'لا توجد بيانات',
            deliveryImage: image ?? '',
            deliveryRate: rate ?? 0);

  factory DeliveryModel.fromJson(Map<String, dynamic> data) {
    return DeliveryModel(
      mail: data['deliveryMail'],
      password: data['deliveryPassword'],
      id: data['deliveryId'],
      name: data['deliveryName'],
      phone: data['deliveryPhone'],
      location: data['deliveryLocation'],
      status: data['deliveryStatus'],
      image: data['deliveryImage'],
      rate: data['deliveryRate'],
    );
  }

  Map<String, dynamic> toJson() => {
        'deliveryId': id,
        'deliveryName': name,
        'deliveryPhone': phone,
        'deliveryImage': image,
        'deliveryLocation': location,
        'deliveryStatus': status,
        'deliveryRate': rate,
        'deliveryMail': mail,
        'deliveryPassword': password
      };
}
