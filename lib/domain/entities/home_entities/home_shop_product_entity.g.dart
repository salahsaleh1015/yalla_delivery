// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_shop_product_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeShopProductEntityAdapter extends TypeAdapter<HomeShopProductEntity> {
  @override
  final int typeId = 3;

  @override
  HomeShopProductEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeShopProductEntity(
      productId: fields[0] as String,
      productName: fields[1] as String,
      productImage: fields[2] as String,
      productPrice: fields[3] as num,
      productDescription: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HomeShopProductEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.productImage)
      ..writeByte(3)
      ..write(obj.productPrice)
      ..writeByte(4)
      ..write(obj.productDescription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeShopProductEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
