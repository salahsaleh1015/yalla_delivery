import 'package:delivery_app/domain/entities/home_entities/home_shop_product_entity.dart';

class ProductModel extends HomeShopProductEntity {
  String? id;
  String? name;
  String? image;
  String? description;
  num? price;

  ProductModel({this.id, this.name, this.image, this.description, this.price})
      : super(
            productId: id!,
            productName: name?? 'لا توجد بيانات',
            productImage: image?? 'لا توجد بيانات',
            productDescription: description?? 'لا توجد بيانات',
            productPrice: price?? 0,);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['productId'],
        name: json['productName'],
        image: json['productImage'],
        description: json['productDescription'],
        price: json['productPrice'],
      );

  Map<String, dynamic> toJson() => {
        'productId': id,
        'productName': name,
        'productImage': image,
        'productDescription': description,
        'productPrice': price,
      };
}
