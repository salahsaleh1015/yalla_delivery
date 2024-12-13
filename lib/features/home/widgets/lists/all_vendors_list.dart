




import 'package:delivery_app/features/home/widgets/items/vendor_item_widget.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllVendorsList extends StatelessWidget {
  const AllVendorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return   Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppPadding.p10.h,
            ),
            child: VendorItemWidget(
              width: MediaQuery.of(context).size.width,
            ),
          ),
          itemCount: 10,
        ));
  }
}