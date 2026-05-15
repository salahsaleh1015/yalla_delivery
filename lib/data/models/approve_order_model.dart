import 'package:delivery_app/data/models/order_info_model.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/user_caching_cubit/user_caching_cubit.dart';

class ApproveOrderModel {
  final OrderInfoModel orderInfoModel;
  final UserCachingCubit userCachingCubit;
  final String userNote;

  ApproveOrderModel(
      {required this.orderInfoModel,
        required this.userCachingCubit,
        required this.userNote});
}