// import 'package:delivery_app/features/global_widgets/global_app_bar.dart';
// import 'package:delivery_app/features/global_widgets/global_padding_widget.dart';
// import 'package:delivery_app/features/home/widgets/items/vendor_item_widget.dart';
// import 'package:delivery_app/features/home/widgets/lists/vendor_list_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../resources/values_manager.dart';
//
// class VendorsView extends StatelessWidget {
//   const VendorsView({super.key});
//   static String id = 'VendorsView';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//       GlobalPaddingWidget(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const GlobalAppBar(
//               title: "موزعي الخدمة",
//             ),
//             SizedBox(
//               height: AppSize.s50.h,
//             ),
//             Text(
//               "جميع مندوبي التوصيل المتاحين",
//               style: Theme.of(context).textTheme.bodyMedium,
//             ),
//             SizedBox(
//               height: AppSize.s10.h,
//             ),
//
//              VendorListWidget(
//                itemWidth: MediaQuery.of(context).size.width,
//               axis: Axis.vertical,
//               verticalSpace: MediaQuery.of(context).size.height*0.7,
//                separatorHeight: AppSize.s10.h,
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
