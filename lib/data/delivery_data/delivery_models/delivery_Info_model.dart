import '../../../domain/delivery_domain/delivery_entities/delivery_account_entity.dart';

class DeliveryInfoModel extends DeliveryInfoEntity {
  String? id;
  String? name;
  String? phone;
  String? location;
  String? status;
  int? rate;
  String? mail;
  String? password;

  DeliveryInfoModel({
    this.id,
    this.name,
    this.phone,
    this.location,
    this.status,
    this.rate,
    this.mail,
    this.password,
  }) : super(
     deliveryMail: mail ?? "البريد الالكتروني مفقود او غير صحيح",
    deliveryLocation: location ?? "العنوان مفقود او غير صحيح",
    deliveryName: name ?? "الاسم مفقود او غير صحيح",
    deliveryPhone: phone ?? "رقم الهاتف مفقود او غير صحيح",
    deliveryStatus: status ?? "الحالة مفقودة او غير صحيح",
  );

  /// 🔹 Factory constructor to create an instance from Firestore/JSON
  factory DeliveryInfoModel.fromJson(Map<String, dynamic> json) {
    return DeliveryInfoModel(
      id: json['deliveryId'],
      name: json['deliveryName'],
      phone: json['deliveryPhone'],
      location: json['deliveryLocation'],
      status: json['deliveryStatus'],
      rate: json['deliveryRate'],
      mail: json['deliveryMail'],
      password: json['deliveryPassword'],

    );
  }

  /// 🔹 Convert model to JSON for saving in Firestore or APIs
  Map<String, dynamic> toJson() {
    return {
      'deliveryId': id,
      'deliveryName': name,
      'deliveryPhone': phone,
      'deliveryLocation': location,
      'deliveryStatus': status,
      'deliveryRate': rate,
      'deliveryMail': mail,
      'deliveryPassword': password,
    };
  }
}
