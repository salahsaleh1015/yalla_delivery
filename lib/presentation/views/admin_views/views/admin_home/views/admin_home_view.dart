
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/admin_views/views/admin_home/views/admin_add_vendor_view.dart';
import 'package:delivery_app/presentation/views/admin_views/views/admin_home/views/admin_vendors_details_view.dart';
import 'package:delivery_app/presentation/views/admin_views/views/admin_home/widgets/add_ads_bar.dart';
import 'package:delivery_app/presentation/views/admin_views/views/admin_home/widgets/admin_main_bar.dart';
import 'package:delivery_app/presentation/views/admin_views/views/admin_home/widgets/admin_statistics_cards_list.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/lists/global_advertisement_list_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/lists/global_vendor_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AdminHomeView extends StatelessWidget {
  const AdminHomeView({super.key});
  static String id = "AdminHomeView";
  @override
  Widget build(BuildContext context) {
    return GlobalPaddingWidget(
        child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AdminMainBar(),
          SizedBox(
            height: AppSize.s15.h,
          ),
          Text("الإحصائيات المختصرة",
              style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(
            height: AppSize.s10.h,
          ),
          const AdminStatisticsCardsList(),
          SizedBox(
            height: AppSize.s30.h,
          ),
          const AddAdsBar(),
          SizedBox(
            height: AppSize.s15.h,
          ),
          const GlobalAdvertisementListWidget(),
          Row(
            children: [
              Text(
                "موزعي الخدمة",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: ColorManager.black),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                  Navigator.pushNamed(context, AdminAddVendorView.id);
                  },
                  child: Row(
                    children: [
                      Text(
                        "عرض الكل",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: ColorManager.primary,
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: AppSize.s15.h,
          ),
          GlobalVendorListWidget(
            onTap: () {
              Navigator.pushNamed(context, AdminVendorDetailsView.id);
            },
          ),
        ],
      ),
    ));
  }
}


