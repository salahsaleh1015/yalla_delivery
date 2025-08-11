class BannerModel {
   String? bannerId;
  final String bannerImage;
  final String bannerShopName;
  final String bannerShopAddress;
  final String bannerShopPhoneNumber;

  BannerModel(
      { this.bannerId,
      required this.bannerImage,
      required this.bannerShopName,
      required this.bannerShopAddress,
      required this.bannerShopPhoneNumber});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      bannerId: json['bannerId'],
      bannerImage: json['bannerImage'],
      bannerShopName: json['bannerShopName'],
      bannerShopAddress: json['bannerShopAddress'],
      bannerShopPhoneNumber: json['bannerShopPhoneNumber'],
    );
  }

  Map<String, dynamic> toJson() => {
        'bannerId': bannerId,
        'bannerImage': bannerImage,
        'bannerShopName': bannerShopName,
        'bannerShopAddress': bannerShopAddress,
        'bannerShopPhoneNumber': bannerShopPhoneNumber,
      };
}
