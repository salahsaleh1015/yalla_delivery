// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cached_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CachedUserModel _$CachedUserModelFromJson(Map<String, dynamic> json) {
  return _CachedUserModel.fromJson(json);
}

/// @nodoc
mixin _$CachedUserModel {
  @HiveField(0)
  String get userLocation => throw _privateConstructorUsedError;
  @HiveField(1)
  String get userName => throw _privateConstructorUsedError;
  @HiveField(2)
  String get phoneNumber => throw _privateConstructorUsedError;
  @HiveField(3)
  String get userMail => throw _privateConstructorUsedError;
  @HiveField(4)
  String get userPassword => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get userId => throw _privateConstructorUsedError;

  /// Serializes this CachedUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CachedUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CachedUserModelCopyWith<CachedUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CachedUserModelCopyWith<$Res> {
  factory $CachedUserModelCopyWith(
          CachedUserModel value, $Res Function(CachedUserModel) then) =
      _$CachedUserModelCopyWithImpl<$Res, CachedUserModel>;
  @useResult
  $Res call(
      {@HiveField(0) String userLocation,
      @HiveField(1) String userName,
      @HiveField(2) String phoneNumber,
      @HiveField(3) String userMail,
      @HiveField(4) String userPassword,
      @HiveField(5) String? userId});
}

/// @nodoc
class _$CachedUserModelCopyWithImpl<$Res, $Val extends CachedUserModel>
    implements $CachedUserModelCopyWith<$Res> {
  _$CachedUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CachedUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userLocation = null,
    Object? userName = null,
    Object? phoneNumber = null,
    Object? userMail = null,
    Object? userPassword = null,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      userLocation: null == userLocation
          ? _value.userLocation
          : userLocation // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userMail: null == userMail
          ? _value.userMail
          : userMail // ignore: cast_nullable_to_non_nullable
              as String,
      userPassword: null == userPassword
          ? _value.userPassword
          : userPassword // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CachedUserModelImplCopyWith<$Res>
    implements $CachedUserModelCopyWith<$Res> {
  factory _$$CachedUserModelImplCopyWith(_$CachedUserModelImpl value,
          $Res Function(_$CachedUserModelImpl) then) =
      __$$CachedUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String userLocation,
      @HiveField(1) String userName,
      @HiveField(2) String phoneNumber,
      @HiveField(3) String userMail,
      @HiveField(4) String userPassword,
      @HiveField(5) String? userId});
}

/// @nodoc
class __$$CachedUserModelImplCopyWithImpl<$Res>
    extends _$CachedUserModelCopyWithImpl<$Res, _$CachedUserModelImpl>
    implements _$$CachedUserModelImplCopyWith<$Res> {
  __$$CachedUserModelImplCopyWithImpl(
      _$CachedUserModelImpl _value, $Res Function(_$CachedUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CachedUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userLocation = null,
    Object? userName = null,
    Object? phoneNumber = null,
    Object? userMail = null,
    Object? userPassword = null,
    Object? userId = freezed,
  }) {
    return _then(_$CachedUserModelImpl(
      userLocation: null == userLocation
          ? _value.userLocation
          : userLocation // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userMail: null == userMail
          ? _value.userMail
          : userMail // ignore: cast_nullable_to_non_nullable
              as String,
      userPassword: null == userPassword
          ? _value.userPassword
          : userPassword // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CachedUserModelImpl implements _CachedUserModel {
  const _$CachedUserModelImpl(
      {@HiveField(0) required this.userLocation,
      @HiveField(1) required this.userName,
      @HiveField(2) required this.phoneNumber,
      @HiveField(3) required this.userMail,
      @HiveField(4) required this.userPassword,
      @HiveField(5) this.userId});

  factory _$CachedUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CachedUserModelImplFromJson(json);

  @override
  @HiveField(0)
  final String userLocation;
  @override
  @HiveField(1)
  final String userName;
  @override
  @HiveField(2)
  final String phoneNumber;
  @override
  @HiveField(3)
  final String userMail;
  @override
  @HiveField(4)
  final String userPassword;
  @override
  @HiveField(5)
  final String? userId;

  @override
  String toString() {
    return 'CachedUserModel(userLocation: $userLocation, userName: $userName, phoneNumber: $phoneNumber, userMail: $userMail, userPassword: $userPassword, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CachedUserModelImpl &&
            (identical(other.userLocation, userLocation) ||
                other.userLocation == userLocation) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.userMail, userMail) ||
                other.userMail == userMail) &&
            (identical(other.userPassword, userPassword) ||
                other.userPassword == userPassword) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userLocation, userName,
      phoneNumber, userMail, userPassword, userId);

  /// Create a copy of CachedUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CachedUserModelImplCopyWith<_$CachedUserModelImpl> get copyWith =>
      __$$CachedUserModelImplCopyWithImpl<_$CachedUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CachedUserModelImplToJson(
      this,
    );
  }
}

abstract class _CachedUserModel implements CachedUserModel {
  const factory _CachedUserModel(
      {@HiveField(0) required final String userLocation,
      @HiveField(1) required final String userName,
      @HiveField(2) required final String phoneNumber,
      @HiveField(3) required final String userMail,
      @HiveField(4) required final String userPassword,
      @HiveField(5) final String? userId}) = _$CachedUserModelImpl;

  factory _CachedUserModel.fromJson(Map<String, dynamic> json) =
      _$CachedUserModelImpl.fromJson;

  @override
  @HiveField(0)
  String get userLocation;
  @override
  @HiveField(1)
  String get userName;
  @override
  @HiveField(2)
  String get phoneNumber;
  @override
  @HiveField(3)
  String get userMail;
  @override
  @HiveField(4)
  String get userPassword;
  @override
  @HiveField(5)
  String? get userId;

  /// Create a copy of CachedUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CachedUserModelImplCopyWith<_$CachedUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
