
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_vendor_item_widget.dart';
import 'package:delivery_app/presentation/views/user_views/views/home/view/shop_details_view.dart';
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
            // child: GlobalVendorItemWidget(
            //   onTap: (){
            //     Navigator.pushNamed(context, ShopDetailsView.id);
            //   },
            //   width: MediaQuery.of(context).size.width,
            // ),
          ),
          itemCount: 10,
        ));
  }
}