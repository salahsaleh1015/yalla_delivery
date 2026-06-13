import 'dart:async';

import 'package:delivery_app/core/resources/assets_manager.dart';
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/core/utils/functions/service_locator_setup.dart';
import 'package:delivery_app/data/repos/home_repo/home_repo_impl.dart';
import 'package:delivery_app/domain/entities/home_entities/home_banner_entity.dart';
import 'package:delivery_app/domain/usecases/home_usecases/home_get_banners_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/home_cubits/get_banners_cubit/get_banners_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../view_models/user_view_models/home_cubits/get_banners_cubit/get_banners_state.dart';
import '../global_loading_indicator.dart';
import '../no_data.dart';

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

class HomeCarouselBanner extends StatefulWidget {
  const HomeCarouselBanner(
      {super.key, required this.bannersLength, required this.banners});
  final int bannersLength;
  final List<HomeBannerEntity> banners;

  @override
  State<HomeCarouselBanner> createState() => _HomeCarouselBannerState();
}

class _HomeCarouselBannerState extends State<HomeCarouselBanner> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: widget.bannersLength,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(
                  image: NetworkImage(
                    widget.banners[itemIndex].bannerImage,
                  ),
                  width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.fill,
                ));
          },
          options: CarouselOptions(
              aspectRatio: 16 / 7,
              viewportFraction: 0.8,
              enableInfiniteScroll: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
              onPageChanged: (i, reason) {
                setState(() {
                  currentIndex = i;
                });
              }),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.banners
              .asMap()
              .entries
              .map((item) => Container(
                    height: 8,
                    width: 8,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == item.key
                          ? ColorManager.primary
                          : ColorManager.lightPrimary,
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}
