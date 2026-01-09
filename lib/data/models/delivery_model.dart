import 'package:cloud_firestore/cloud_firestore.dart';
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

  DeliveryModel(
      {this.mail,
      this.password,
      this.id,
      this.name,
      this.phone,
      this.location,
      this.status,
      this.rate})
      : super(
            deliveryName: name?? 'لا توجد بيانات',
            deliveryStatus: status?? 'لا توجد بيانات',
            deliveryRate: rate?? 0);

  factory DeliveryModel.fromJson(Map<String, dynamic> data) {
    return DeliveryModel(
      mail: data['deliveryMail'],
      password: data['deliveryPassword'],
      id: data['deliveryId'],
      name: data['deliveryName'],
      phone: data['deliveryPhone'],
      location: data['deliveryLocation'],
      status: data['deliveryStatus'],
      rate: data['deliveryRate'],
    );
  }

  Map<String, dynamic> toJson() => {
        'deliveryId': id,
        'deliveryName': name,
        'deliveryPhone': phone,
        'deliveryLocation': location,
        'deliveryStatus': status,
        'deliveryRate': rate,
        'deliveryMail': mail,
        'deliveryPassword': password
      };
}
