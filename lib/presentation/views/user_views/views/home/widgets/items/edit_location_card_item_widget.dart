import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/core/services/firebase_services/firestore_user_info_services.dart';
import 'package:delivery_app/domain/usecases/cache_user_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/user_caching_cubit/user_caching_cubit.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/user_info_cubit/user_info_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../injection.dart';

class EditLocationCardItemWidget extends StatelessWidget {
  const EditLocationCardItemWidget({
    super.key,
    required this.userPhone,
  });

  final String userPhone;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCachingCubit>(
        create: (context) => UserCachingCubit(
            sl.get<CacheUserUseCase>(),
            sl.get<GetCachedUserUseCase>(),
            sl<UpdateCachedUserUseCase>(),
            sl<FirebaseUserServices>())..loadCachedUser(),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "موقع التوصيل:",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const Spacer(),

                        // TextButton(
                        //   onPressed: () {
                        //     locationDialog(context);
                        //   },
                        //   child: Row(
                        //     children: [
                        //       Text(
                        //         "تغيير",
                        //         style: Theme.of(context).textTheme.labelLarge,
                        //       ),
                        //       Icon(
                        //         Icons.arrow_forward,
                        //         color: ColorManager.primary,
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.s10.h,
                    ),
                    BlocBuilder<UserCachingCubit, UserCachingStates>(
                      builder: (context, state) {
                        var cubit = UserCachingCubit.get(context);
                        return Text(
                          cubit.cachedUserModel.userLocation,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: ColorManager.black),
                        );
                      },
                    ),
                  ],
                )),
          ),
        ));
  }
}
