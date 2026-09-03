// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderEntityAdapter extends TypeAdapter<OrderEntity> {
  @override
  final int typeId = 5;

  @override
  OrderEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderEntity(
      userName: fields[0] as String,
      orderId: fields[8] as String,
      userLocation: fields[1] as String,
      userPhone: fields[2] as String,
      orderNumber: fields[9] as num,
      deliveryName: fields[3] as String,
      orderDetails: fields[4] as String,
      orderStatus: fields[5] as String,
      orderRequestTime: fields[6] as String,
      orderNotes: fields[7] as String,
      deliveryNumber: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OrderEntity obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
