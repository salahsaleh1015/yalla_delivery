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

  factory DeliveryModel.fromJson(Map<String, dynamic> json) => DeliveryModel(
        deliveryMail: json['deliveryMail'],
        deliveryPassword: json['deliveryPassword'],
        deliveryId: json['deliveryId'],
        deliveryName: json['deliveryName'],
        deliveryPhone: json['deliveryPhone'],
        deliveryLocation: json['deliveryLocation'],
        deliveryStatus: json['deliveryStatus'],
        deliveryRate: json['deliveryRate'],
      );

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
