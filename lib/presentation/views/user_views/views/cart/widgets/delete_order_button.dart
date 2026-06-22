import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/font_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/utils/functions/service_locator_setup.dart';
import 'package:delivery_app/core/utils/popup_toast_helper.dart';
import 'package:delivery_app/data/repos/cart_repos/cart_repo_impl.dart';
import 'package:delivery_app/domain/usecases/cart_usecases/user_delete_order_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/delete_order_cubit/delete_order_cubit.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_orders_cubit/delete_order_cubit/delete_order_state.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/delete_order_dialog.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_light_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteOrderButton extends StatelessWidget {
  const DeleteOrderButton({super.key, required this.orderId});
  final String orderId;
  @override
  Widget build(BuildContext context) {
    return GlobalLightButtonWidget(
      child: Text(
        "مسح الطلب ",
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: ColorManager.error, fontSize: FontSize.s16.sp),
      ),
      onTap: () {
        deleteOrderDialog(context, orderId: orderId);
        // DeleteOrderCubit.get(context).deleteOrder(
        //   orderId: orderId,
        // );
      },
    );
  }
}
