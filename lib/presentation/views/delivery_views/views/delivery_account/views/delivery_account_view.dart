import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/domain/delivery_domain/delivery_entities/delivery_account_entity.dart';
import 'package:delivery_app/domain/delivery_domain/delivery_usecases/delivery_fetch_status_usecase.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_account_widgets/global_account_info_bar_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_account_widgets/global_account_info_section_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_account_widgets/global_profile_card_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_logout_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/functions/service_locator_setup.dart';
import '../../../../../../domain/delivery_domain/delivery_repos/delivery_info_repo.dart';
import '../../../../../../domain/delivery_domain/delivery_usecases/delivery_edit_info_data_usecase.dart';
import '../../../../../../domain/delivery_domain/delivery_usecases/delivery_fetch_account_data_usecase.dart';

import '../../../../../view_models/delivery_view_models/delivery_info_cubit/delivery_info_cubit.dart';
import '../../../../global_widgets/global_loading_indicator.dart';

class DeliveryAccountView extends StatelessWidget {
  const DeliveryAccountView({super.key, required this.deliveryGmail});

  final String deliveryGmail;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeliveryInfoCubit>(
      create: (context) => DeliveryInfoCubit(
          DeliveryFetchInfoDataUseCase(
            getIt.get<DeliveryInfoRepo>(),
          ),
          DeliveryEditInfoDataUseCase(
            getIt.get<DeliveryInfoRepo>(),
          ),
          DeliveryFetchStatusUseCase(
            getIt.get<DeliveryInfoRepo>(),
          ),
        getIt.get<DeliveryInfoRepo>(),
      )
        ..getDeliveryInfo(deliveryMail: deliveryGmail),
      child: BlocBuilder<DeliveryInfoCubit, DeliveryInfoStates>(
        builder: (context, state) {
          var cubit = DeliveryInfoCubit.get(context);
          if (state is DeliveryGetInfoLoadingState) {
            return const Center(
              child: GlobalLoadingIndicator(),
            );
          } else if (state is DeliveryGetInfoErrorState) {
            return Center(
                child: Text(
              state.errorMessage,
              style: Theme.of(context).textTheme.headlineSmall,
            ));
          } else if (state is DeliveryGetInfoLoadedState) {
            final delivery = state.delivery;
            return Scaffold(
              body: GlobalPaddingWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "الحساب",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s30.h,
                    ),
                    GlobalAccountInfoSectionWidget(
                      joinDate: delivery.deliveryPhone,
                      userName: delivery.deliveryName,
                    ),
                    SizedBox(
                      height: AppSize.s20.h,
                    ),
                    Divider(
                      color: ColorManager.socialButtonColor,
                      height: AppSize.s1.h,
                    ),
                    SizedBox(
                      height: AppSize.s30.h,
                    ),
                    GlobalAccountInfoBarWidget(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.deliveryEditAccountRoute,
                          arguments: DeliveryInfoEntity(
                            deliveryStatus: delivery.deliveryStatus,
                            deliveryMail: delivery.deliveryMail,
                            deliveryLocation: delivery.deliveryLocation,
                            deliveryName: delivery.deliveryName,
                            deliveryPhone: delivery.deliveryPhone,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: AppSize.s10.h,
                    ),
                    GlobalProfileCardWidget(
                      fieldName: "الاسم بالكامل",
                      fieldValue: delivery.deliveryName,
                    ),
                    SizedBox(
                      height: AppSize.s20.h,
                    ),
                    GlobalProfileCardWidget(
                      fieldName: "رقم الهاتف",
                      fieldValue: delivery.deliveryPhone,
                    ),
                    // GlobalAdsBarWidget(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, AdsPartnerView.id);
                    //   },
                    // ),
                    SizedBox(
                      height: AppSize.s50.h,
                    ),
                    GlobalLogoutButtonWidget(
                      actionButtonCall: () async {
                        cubit.signOut();
                        final box = Hive.box<DeliveryInfoEntity>(kDeliveryInfoBox);
                        await box.clear();
                        Navigator.pushReplacementNamed(
                            context, Routes.deliveryAuthenticationRoute);
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
