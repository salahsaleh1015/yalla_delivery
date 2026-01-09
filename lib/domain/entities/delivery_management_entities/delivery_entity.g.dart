// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeliveryEntityAdapter extends TypeAdapter<DeliveryEntity> {
  @override
  final int typeId = 4;

  @override
  DeliveryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeliveryEntity(
      deliveryName: fields[0] as String,
      deliveryStatus: fields[1] as String,
      deliveryRate: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DeliveryEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.deliveryName)
      ..writeByte(1)
      ..write(obj.deliveryStatus)
      ..writeByte(2)
      ..write(obj.deliveryRate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeliveryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
