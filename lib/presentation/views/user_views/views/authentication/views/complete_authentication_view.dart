import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/core/services/shared_preferences_services/shared_preferences_services.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/user_caching_cubit/user_caching_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/routes_manager.dart';
import '../../../../../../domain/usecases/cache_user_usecase.dart';
import '../../../../../../injection.dart';
import '../../../../../models/cached_user_model.dart';
import '../../../../../models/user_model.dart';

class CompleteAuthenticationView extends StatelessWidget {
  const CompleteAuthenticationView(
      {super.key, required this.userModel, required this.isSignUpFlow});
  final UserModel userModel;
  final bool isSignUpFlow;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCachingCubit>(
      create: (context) => UserCachingCubit(
          sl.get<CacheUserUseCase>(), sl.get<GetCachedUserUseCase>(),sl<UpdateCachedUserUseCase>()),
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    AssetsManager.completeAuthImage1,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.4,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    AssetsManager.completeAuthImage2,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.4,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.s10.h,
              ),
              Text(
                "تهانينا لقد تم تسجيل حسابك بنجاح",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: ColorManager.secondaryTextColor,
                    ),
              ),
              SizedBox(
                height: AppSize.s10.h,
              ),
              BlocBuilder<UserCachingCubit, UserCachingStates>(
                builder: (context, state) {

                  var cubit = UserCachingCubit.get(context);
                  if (state is UserCachingLoadingState) {
                    return const GlobalLoadingIndicator();
                  }
                  return GlobalButtonWidget(
                      text: "استمر",
                      onTap: () async {
                        print(userModel.phoneNumber);
                        final cachedUserModel = await handleUserCaching(
                          isSignUpFlow: isSignUpFlow,
                          userModel: userModel,
                          cubit: cubit,
                        );

                        if (cachedUserModel != null) {
                          cubit.cachedUserModel = cachedUserModel;
                          await CacheHelper.setData(
                              key: 'authorized', value: true);
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.mainLayoutRoute,
                          );
                        } else {
                          print("////////////////////////////////////////");
                          print(state.toString());
                          // Show error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("هناك خطأ ما حاول في وقت لاحق ")),
                          );
                        }
                      },
                      width: MediaQuery.of(context).size.width * 0.5,
                      isButtonEnabled: true);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<CachedUserModel?> handleUserCaching({
    required bool isSignUpFlow,
    required UserModel userModel,
    required UserCachingCubit cubit,
  }) async {
    try {
      CachedUserModel cachedUserModel;

      if (isSignUpFlow) {
        cachedUserModel = CachedUserModel(
          phoneNumber: userModel.phoneNumber,
          userLocation: userModel.userLocation,
          userName: userModel.userName,
          userId: userModel.userId,
        );
      } else {
        final doc = await FirebaseFirestore.instance
            .collection("Users")
            .where("phoneNumber", isEqualTo: userModel.phoneNumber)
            .get();

        if (doc.docs.isEmpty) {
          debugPrint("User not found in Firestore");
          return null;
        }

        final data = doc.docs.first.data();
        cachedUserModel = CachedUserModel(
          phoneNumber: data['phoneNumber'],
          userLocation: data['userLocation'],
          userName: data['userName'],
          userId: data['userId'],
        );
      }

      // Cache locally
      cubit.cacheUser(cachedUserModel);

      print(cachedUserModel.phoneNumber);

      return cachedUserModel;
    } catch (e) {
      debugPrint("Error while caching user: $e");
      return null;
    }
  }
}
