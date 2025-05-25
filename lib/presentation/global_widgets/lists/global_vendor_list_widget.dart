import 'package:delivery_app/presentation/global_widgets/global_vendor_item_widget.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GlobalVendorListWidget extends StatelessWidget {
  const GlobalVendorListWidget({
    super.key, required this.onTap,
  });

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.s315.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(
          width: AppSize.s10.w,
        ),
        itemCount: 10,
        itemBuilder: (context, index) =>  GlobalVendorItemWidget(
          onTap: onTap,
        ),
      ),
    );
  }
}
