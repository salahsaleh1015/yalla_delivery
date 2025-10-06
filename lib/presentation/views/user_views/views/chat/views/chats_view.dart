import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/values_manager.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s70.r),
            child: Image.asset(
                     //color: ColorManager.transparent,
              AssetsManager.emptyChat,
              height: AppSize.s250.h,
              width: AppSize.s250.w,
            ),
          ),
          Text(
            "سيتاح لك مراسله المندوبين قريبا.",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
// return BlocProvider<DeliveryInUserCubit>(
//   create: (context) => DeliveryInUserCubit()..getAllDeliveries(),
//   child: GlobalPaddingWidget(
//       child: SingleChildScrollView(
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               width: AppSize.s30.w,
//             ),
//             Text(
//               "كل المندوبين",
//               style: Theme.of(context).textTheme.titleMedium,
//             ),
//             GlobalCircularButtonWidget(
//               onTap: () {
//                 Navigator.pushNamed(context, CartView.id);
//               },
//               icon: Icons.shopping_cart_outlined,
//             ),
//           ],
//         ),
//         SizedBox(
//           height: AppSize.s30.h,
//         ),
//         const GlobalSearchCardItemWidget(
//           hintText: 'بحث',
//         ),
//         SizedBox(
//           height: AppSize.s30.h,
//         ),
//         BlocBuilder<DeliveryInUserCubit, DeliveryInUserStates>(
//           builder: (context, state) {
//             var cubit = DeliveryInUserCubit.get(context);
//             if (state is GetAllDeliveriesInUsersLoadingState) {
//               return const Center(
//                 child: GlobalLoadingIndicator(),
//               );
//             } else if (state is GetAllDeliveriesInUserErrorState) {
//               return Center(
//                 child: Text(state.errorMsg),
//               );
//             } else if (state is GetAllDeliveriesInUserSuccessState) {
//               if (cubit.deliveriesList.isEmpty) {
//                 return const GlobalNoDeliveriesWidget();
//               }
//               return GlobalDecoratedContainer(
//                   child: ListView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) => ChatTileWidget(
//                   deliveryPhoneNumber:
//                       cubit.deliveriesList[index].deliveryPhone,
//                   deliveryName: cubit.deliveriesList[index].deliveryName,
//                 ),
//                 itemCount: cubit.deliveriesList.length,
//               ));
//             } else {
//               return const GlobalSomethingWrongWidget();
//             }
//           },
//         ),
//         SizedBox(
//           height: AppSize.s30.h,
//         )
//       ],
//     ),
//   )),
// );
