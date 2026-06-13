
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/utils/functions/service_locator_setup.dart';
import 'package:delivery_app/data/repos/home_repo/home_repo_impl.dart';
import 'package:delivery_app/domain/entities/home_entities/home_banner_entity.dart';
import 'package:delivery_app/domain/usecases/home_usecases/home_get_banners_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/home_cubits/get_banners_cubit/get_banners_cubit.dart';
import 'package:delivery_app/presentation/views/user_views/views/home/widgets/items/home_carousel_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../view_models/user_view_models/home_cubits/get_banners_cubit/get_banners_state.dart';
import '../global_loading_indicator.dart';


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
        //height: AppSize.s150.h,
        child: BlocBuilder<GetBannersCubit, GetBannersStates>(
          builder: (context, state) {
            if (state is GetBannersErrorState) {
              return Center(child: Text("حدث خطأ ما حاول مره اخرى"));
            } else if (state is GetBannersLoadingState) {
              return const Center(child: GlobalLoadingIndicator());
            } else if (state is GetBannersLoadedState) {
              if (state.bannersList.isEmpty) {
                return Center(
                    child: Text(
                  "لا يوجد اعلانات",
                  style: Theme.of(context).textTheme.headlineSmall,
                ));
              }
              return HomeCarouselBanner(
                bannersLength: state.bannersList.length,
                banners: state.bannersList,
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

