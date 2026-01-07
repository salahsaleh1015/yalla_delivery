import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/core/utils/functions/service_locator_setup.dart';
import 'package:delivery_app/data/repos/home_repo/home_repo_impl.dart';
import 'package:delivery_app/domain/usecases/home_usecases/home_get_banners_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/home_cubits/get_banners_cubit/get_banners_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_advertisement_item_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/routes_manager.dart';
import '../../../view_models/user_view_models/home_cubits/get_banners_cubit/get_banners_state.dart';

class GlobalAdvertisementListWidget extends StatelessWidget {
  const GlobalAdvertisementListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetBannersCubit>(
      create: (context) =>
          GetBannersCubit(HomeGetBannersUseCase(getIt.get<HomeRepoImpl>()))
            ..fetchBanners(),
      child: SizedBox(
        width: double.infinity,
        height: AppSize.s150.h,
        child: BlocBuilder<GetBannersCubit, GetBannersStates>(
          builder: (context, state) {
            if (state is GetBannersErrorState) {
              return Center(child: Text("حدث خطأ ما حاول مره اخرى"));
            } else if (state is GetBannersLoadingState) {
              return const Center(child: GlobalLoadingIndicator());
            } else if (state is GetBannersLoadedState) {
              if (state.bannersList.isEmpty) {
                return Center(child: NoData());
              }
              return ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: AppSize.s10.w),
                scrollDirection: Axis.horizontal,
                itemCount: state.bannersList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.bannerDetailsRoute,
                        arguments: state.bannersList[index]);
                  },
                  child: GlobalAdvertisementItemWidget(
                    title: state.bannersList[index].bannerShopName,
                    image: state.bannersList[index].bannerImage,
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
