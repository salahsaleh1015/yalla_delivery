import 'package:delivery_app/presentation/view_models/user_view_models/delivery_in_user_cubit/delivery_in_user_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_circular_button_widget.dart';
import '../../../../global_widgets/global_decorated_container.dart';
import '../../../../global_widgets/global_no_deliveries_widget.dart';
import '../../../../global_widgets/global_padding_widget.dart';
import '../../../../global_widgets/global_search_card_item_widget.dart';
import '../../../../global_widgets/global_something_wrong_widget.dart';
import '../../cart/views/cart_view.dart';
import '../widgets/chat_tile_widget.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeliveryInUserCubit>(
      create: (context) => DeliveryInUserCubit()..getAllDeliveries(),
      child: GlobalPaddingWidget(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: AppSize.s30.w,
                ),
                Text(
                  "كل المندوبين",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                GlobalCircularButtonWidget(
                  onTap: () {
                    Navigator.pushNamed(context, CartView.id);
                  },
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s30.h,
            ),
            const GlobalSearchCardItemWidget(
              hintText: 'بحث',
            ),
            SizedBox(
              height: AppSize.s30.h,
            ),
            BlocBuilder<DeliveryInUserCubit, DeliveryInUserStates>(
              builder: (context, state) {
                var cubit = DeliveryInUserCubit.get(context);
                if (state is GetAllDeliveriesInUsersLoadingState) {
                  return const Center(
                    child: GlobalLoadingIndicator(),
                  );
                } else if (state is GetAllDeliveriesInUserErrorState) {
                  return Center(
                    child: Text(state.errorMsg),
                  );
                } else if (state is GetAllDeliveriesInUserSuccessState) {
                  if (cubit.deliveriesList.isEmpty) {
                    return const GlobalNoDeliveriesWidget();
                  }
                  return GlobalDecoratedContainer(
                      child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ChatTileWidget(
                      deliveryPhoneNumber:
                          cubit.deliveriesList[index].deliveryPhone,
                      deliveryName: cubit.deliveriesList[index].deliveryName,
                    ),
                    itemCount: cubit.deliveriesList.length,
                  ));
                } else {
                  return const GlobalSomethingWrongWidget();
                }
              },
            ),
            SizedBox(
              height: AppSize.s30.h,
            )
          ],
        ),
      )),
    );
  }
}
