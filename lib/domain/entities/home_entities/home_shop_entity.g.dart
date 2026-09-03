// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_shop_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeShopEntityAdapter extends TypeAdapter<HomeShopEntity> {
  @override
  final int typeId = 2;

  @override
  HomeShopEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeShopEntity(  shopName: fields[0] as String,
      shopId: fields[1] as String,
      shopAddress: fields[2] as String,
      shopPhoneNumber: fields[3] as String,
      shopImage: fields[4] as String,
      shopRate: fields[5] as String,);
  }

  @override
  void write(BinaryWriter writer, HomeShopEntity obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeShopEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
