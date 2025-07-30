import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/font_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/user_info_cubit/user_info_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_divider_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../global_widgets/global_dialogs/location_dialog.dart';

class EditLocationCardItemWidget extends StatelessWidget {
  const EditLocationCardItemWidget({
    super.key,
    required this.userPhone,
  });

  final String userPhone;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserInfoCubit>(
        create: (context) => UserInfoCubit()
          ..getUserLocationByPhoneNumber(phoneNumber: userPhone),
        child: Card.outlined(
          color: ColorManager.white,
          elevation: AppSize.s5.r,
          child: Padding(
            padding: EdgeInsets.all(AppPadding.p8.r),
            child: SizedBox(
                //height: AppSize.s30.h,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "موقع التوصيل:",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            locationDialog(context);
                          },
                          child: Row(
                            children: [
                              Text(
                                "تغيير",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: ColorManager.primary,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.s10.h,
                    ),
                    BlocBuilder<UserInfoCubit, UserInfoStates>(
                      builder: (context, state) {
                        var cubit = UserInfoCubit.get(context);
                        if (state is UserLocationLoadedSuccessfullyState) {
                          return Text(
                            cubit.userLocation,


                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: ColorManager.black),
                          );
                        }else if(state is UserLocationLoadingState){
                          return const Center(child: GlobalLoadingIndicator(),);
                        }else if(state is UserLocationErrorState){
                          return Center(
                            child: Text(
                              state.error,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: ColorManager.black),
                            ),
                          );
                        }else{
                          return  Center(child: Text(
                            "هناك خطاء ما خاول في وقت لاحق",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: ColorManager.black),
                          ),);
                        }



                      },
                    ),
                  ],
                )),
          ),
        ));
  }
}
