// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedUserModelAdapter extends TypeAdapter<CachedUserModel> {
  @override
  final int typeId = 0;

  @override
  CachedUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedUserModel(
      userLocation: fields[0] as String,
      userName: fields[1] as String,
      phoneNumber: fields[2] as String,
      userId: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CachedUserModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userLocation)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CachedUserModelImpl _$$CachedUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CachedUserModelImpl(
      userLocation: json['userLocation'] as String,
      userName: json['userName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$CachedUserModelImplToJson(
        _$CachedUserModelImpl instance) =>
    <String, dynamic>{
      'userLocation': instance.userLocation,
      'userName': instance.userName,
      'phoneNumber': instance.phoneNumber,
      'userId': instance.userId,
    };
