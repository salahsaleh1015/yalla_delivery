part of 'delivery_edit_info_cubit.dart';

@immutable
sealed class DeliveryEditInfoStates {}

final class DeliveryEditInfoInitialState extends DeliveryEditInfoStates {}

class DeliveryEditInfoLoadingState extends DeliveryEditInfoStates {}

final class DeliveryEditInfoSavedState extends DeliveryEditInfoStates {}

final class DeliveryEditInfoErrorState extends DeliveryEditInfoStates {
  final String errorMessage;

  DeliveryEditInfoErrorState({required this.errorMessage});
}
