class ProductModel {
  final String? productId;
  final String productName;
  final String productImage;
  final String productDescription;
  final num productPrice;

  ProductModel(
      { this.productId,
      required this.productName,
      required this.productImage,
      required this.productDescription,
      required this.productPrice});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productId: json['productId'],
    productName: json['productName'],
    productImage: json['productImage'],
    productDescription: json['productDescription'],
    productPrice: json['productPrice'],
  );

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'productName': productName,
    'productImage': productImage,
    'productDescription': productDescription,
    'productPrice': productPrice,
  };
}
