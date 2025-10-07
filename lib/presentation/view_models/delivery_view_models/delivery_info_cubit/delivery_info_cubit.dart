

import 'package:flutter_bloc/flutter_bloc.dart';

part 'delivery_info_state.dart';

class DeliveryInfoCubit extends Cubit<DeliveryInfoStates> {
  DeliveryInfoCubit() : super(DeliveryInfoInitialState());

  static DeliveryInfoCubit get(context) => BlocProvider.of(context);



}
