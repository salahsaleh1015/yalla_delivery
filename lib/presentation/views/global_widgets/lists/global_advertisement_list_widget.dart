import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/models/banner_model.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_advertisement_item_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/routes_manager.dart';
import '../../../view_models/user_view_models/home_cubits/banners_cubit/banners_cubit.dart';

class GlobalAdvertisementListWidget extends StatelessWidget {
  const GlobalAdvertisementListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BannersCubit>(
      create: (context) => BannersCubit()..getAllBanners(),
      child: SizedBox(
        width: double.infinity,
        height: AppSize.s150.h,
        child: BlocBuilder<BannersCubit, BannersStates>(
          builder: (context, state) {
            var cubit = BannersCubit.get(context);
            if (state is BannersErrorState) {
              return Center(child: Text(state.errorMessage));
            } else if (state is BannersLoadingState) {
              return const Center(child: GlobalLoadingIndicator());
            } else if (state is BannersLoadedState) {
              if (cubit.bannersList.isEmpty) {
                return Center(
                    child: Text(
                  "لا يوجد اعلانات",
                  style: Theme.of(context).textTheme.headlineSmall,
                ));
              }
              return ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: AppSize.s10.w),
                scrollDirection: Axis.horizontal,
                itemCount: cubit.bannersList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.bannerDetailsRoute,
                        arguments: cubit.bannersList[index]);
                  },
                  child: GlobalAdvertisementItemWidget(
                    title: cubit.bannersList[index].bannerShopName,
                    image: cubit.bannersList[index].bannerImage,
                  ),
                ),
              );
            } else {
              return Center(
                  child: Text(
                "لا يوجد اعلانات",
                style: Theme.of(context).textTheme.headlineSmall,
              ));
            }
          },
        ),
      ),
    );
  }
}
