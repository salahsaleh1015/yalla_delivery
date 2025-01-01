



import 'package:delivery_app/admin_features/admin_home/widgets/admin_statistics_card.dart';
import 'package:delivery_app/resources/assets_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminStatisticsCardsList extends StatelessWidget {
  const AdminStatisticsCardsList({super.key});

  /// add model of statistics
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: AppSize.s130.h,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children:  [
            const AdminStatisticsCard(
              iconPath: AssetsManager.vehicleIcon,
              statisticsNumber: 22,
              statisticsTitle: "عدد الديلفرات المسجلين",
            ),
            SizedBox(
              width: AppSize.s10.w,
            ),
            const AdminStatisticsCard(
              iconPath: AssetsManager.checkMarkIcon,
              statisticsNumber: 180,
              statisticsTitle: "عدد الطلبات المكتملة",
            ),SizedBox(
              width: AppSize.s10.w,
            ),
            const AdminStatisticsCard(
              iconPath: AssetsManager.userIcon,
              statisticsNumber: 150,
              statisticsTitle: "عدد المستخدمين",
            ),
          ]
      ),
    );
  }
}