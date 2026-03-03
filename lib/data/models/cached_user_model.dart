import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'cached_user_model.freezed.dart';
part 'cached_user_model.g.dart';

@freezed
@HiveType(typeId: 0) // Hive adapter type ID
class CachedUserModel with _$CachedUserModel {
  const factory CachedUserModel({
    @HiveField(0) required String userLocation,
    @HiveField(1) required String userName,
    @HiveField(2) required String phoneNumber,
    @HiveField(3) required String userMail,
    @HiveField(4) required String userPassword,
    @HiveField(5) String? userId,
  }) = _CachedUserModel;

  factory CachedUserModel.fromJson(Map<String, dynamic> json) =>
      _$CachedUserModelFromJson(json);

}
