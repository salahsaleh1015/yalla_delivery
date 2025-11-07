part of 'delivery_edit_status_cubit.dart';

@immutable
sealed class DeliveryEditStatusStates {}

final class DeliveryEditStatusInitialState extends DeliveryEditStatusStates {}




class DeliveryEditStatusLoadingState extends DeliveryEditStatusStates {}
class DeliveryEditStatusSuccessState extends DeliveryEditStatusStates {}
class DeliveryEditStatusErrorState extends DeliveryEditStatusStates {
  final String errorMessage;

  DeliveryEditStatusErrorState({required this.errorMessage});
}

