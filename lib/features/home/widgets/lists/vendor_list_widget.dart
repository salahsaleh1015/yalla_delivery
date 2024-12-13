import 'package:delivery_app/features/home/widgets/items/vendor_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/values_manager.dart';

class VendorListWidget extends StatelessWidget {
  const VendorListWidget({
    super.key,
  });

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
        itemBuilder: (context, index) => const VendorItemWidget(),
      ),
    );
  }
}
