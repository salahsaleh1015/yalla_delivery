import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/assets_manager.dart';

class DeliveryChatView extends StatelessWidget {
  const DeliveryChatView({super.key});
  static String id = 'DeliveryChatView';
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







// return Scaffold(
// body: GlobalPaddingWidget(
// child: SingleChildScrollView(
// child: Column(
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// SizedBox(
// width: AppSize.s30.w,
// ),
// Text(
// "كل المندوبين",
// style: Theme.of(context).textTheme.titleMedium,
// ),
// GlobalCircularButtonWidget(
// onTap: () {
// Navigator.pushNamed(context, CartView.id);
// },
// icon: Icons.shopping_cart_outlined,
// ),
// ],
// ),
// SizedBox(
// height: AppSize.s30.h,
// ),
// const GlobalSearchCardItemWidget(
// hintText: 'بحث',
// ),
// SizedBox(
// height: AppSize.s30.h,
// ),
// GlobalDecoratedContainer(
// child: ListView.builder(
// physics: const NeverScrollableScrollPhysics(),
// shrinkWrap: true,
// itemBuilder: (context, index) => const ChatTileWidget(
// deliveryName: '',
// deliveryPhoneNumber: "",
// ),
// itemCount: 10,
// )),
// SizedBox(
// height: AppSize.s30.h,
// )
// ],
// ),
// )),
//);