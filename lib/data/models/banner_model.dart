import 'package:delivery_app/domain/entities/home_entities/home_banner_entity.dart';

class BannerModel extends HomeBannerEntity {
  String? id;
  String? image;
  String? language;

  BannerModel({
    this.id,
    this.image,
    this.language,
  }) : super(
          bannerId: id ?? "",
          bannerLanguage: language ?? "arabic",
          bannerImage: image ??
              "https://firebasestorage.googleapis.com/v0/b/yalla-delivery-app-f5ce2.firebasestorage.app/o/bannerFourImage.jpeg?alt=media&token=1adf43c1-0958-46ed-b80a-988202f1c543",
        );

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['bannerId'],
      image: json['bannerImage'],
      language: json['bannerLanguage'],
    );
  }

  Map<String, dynamic> toJson() => {
        'bannerId': id,
        'bannerImage': image,
        'bannerLanguage': language,
      };
}
