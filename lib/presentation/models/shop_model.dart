class ShopModel {
  final String shopName;
  final String? shopId;
  final String shopAddress;
  final String shopPhoneNumber;
  final String shopImage;
  final num shopRate;

  ShopModel(
      {required this.shopName,
       this.shopId,
      required this.shopAddress,
      required this.shopPhoneNumber,
      required this.shopImage,
      required this.shopRate});


  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
    shopName: json['shopName'],
    shopId: json['shopId'],
    shopAddress: json['shopAddress'],
    shopPhoneNumber: json['shopPhoneNumber'],
    shopImage: json['shopImage'],
    shopRate: json['shopRate'],
  );

  Map<String, dynamic> toJson(){
    return {
      'shopName': shopName,
      'shopId': shopId,
      'shopAddress': shopAddress,
      'shopPhoneNumber': shopPhoneNumber,
      'shopImage': shopImage,
      'shopRate': shopRate,
    };
  }

}
