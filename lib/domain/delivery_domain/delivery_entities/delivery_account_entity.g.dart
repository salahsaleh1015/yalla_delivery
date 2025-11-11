// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_account_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeliveryInfoEntityAdapter extends TypeAdapter<DeliveryInfoEntity> {
  @override
  final int typeId = 1;

  @override
  DeliveryInfoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeliveryInfoEntity(
      deliveryName: fields[0] as String,
      deliveryPhone: fields[1] as String,
      deliveryLocation: fields[2] as String,
      deliveryMail: fields[3] as String,
      deliveryStatus: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DeliveryInfoEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.deliveryName)
      ..writeByte(1)
      ..write(obj.deliveryPhone)
      ..writeByte(2)
      ..write(obj.deliveryLocation)
      ..writeByte(3)
      ..write(obj.deliveryMail)
      ..writeByte(4)
      ..write(obj.deliveryStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeliveryInfoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
