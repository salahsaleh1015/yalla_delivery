
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_vendor_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/routes_manager.dart';


class GlobalVendorListWidget extends StatelessWidget {
  const GlobalVendorListWidget({
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
        itemBuilder: (context, index) =>  GlobalVendorItemWidget(
          onTap: (){
            Navigator.pushNamed(context, Routes.shopDetailsRoute);
          },
        ),
      ),
    );
  }
}
