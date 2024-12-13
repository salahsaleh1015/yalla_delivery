import 'package:delivery_app/features/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/features/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/features/home/widgets/items/vendor_item_widget.dart';
import 'package:delivery_app/features/home/widgets/lists/all_vendors_list.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllVendorsView extends StatelessWidget {
  const AllVendorsView({super.key});
  static String id = "AllVendorsView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GlobalCircularButtonWidget(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  icon: Icons.arrow_back),
              Text(
                "شركاء الاعلانات",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                width: AppSize.s30.w,
              ),
            ],
          ),
          SizedBox(
            height: AppSize.s50.h,
          ),
          const AllVendorsList(),
        ],
      )),
    );
  }
}
