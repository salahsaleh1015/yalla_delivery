import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/data/models/cached_user_model.dart';
import 'package:delivery_app/domain/usecases/cache_user_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/user_caching_cubit/user_caching_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_text_field_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_user_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/routes_manager.dart';
import '../../../../../../injection.dart';

class EditAccountView extends StatefulWidget {
  const EditAccountView({super.key});

  @override
  State<EditAccountView> createState() => _EditAccountViewState();
}

class _EditAccountViewState extends State<EditAccountView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  bool isButtonEnabled = false;

  late String name, phoneNumber, location;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _checkIfFieldsAreFilled() {
    final isFilled = _nameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _locationController.text.isNotEmpty;

    setState(() {
      isButtonEnabled = isFilled;
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkIfFieldsAreFilled);
    _phoneController.addListener(_checkIfFieldsAreFilled);
    _locationController.addListener(_checkIfFieldsAreFilled);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCachingCubit(
        sl.get<CacheUserUseCase>(),
        sl.get<GetCachedUserUseCase>(),
        sl<UpdateCachedUserUseCase>(),
      )..loadCachedUser(),
      // ✅ استخدمت BlocConsumer بدلاً من BlocBuilder
      child: BlocConsumer<UserCachingCubit, UserCachingStates>(
        listener: (context, state) {
          // ✅ هنا حطيت الـ Navigator.pop عشان مايتناديش كل مرة الـ build يشتغل
          if (state is UserCachingLoadedState) {
            Navigator.pushReplacementNamed(context, Routes.mainLayoutRoute,);

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("تم الحفظ بنجاح"),
                  content: const Text("  سيتم استخدام  بياناتك الجديده اثناء الطلب "),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // يقفل الـ Dialog
                      },
                      child: const Text("تم"),
                    ),

                  ],
                );
              },
            );

          }
          // ✅ هنا SnackBar بيتعرض مرة واحدة بس مش مع كل rebuild
          else if (state is UserCachingErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 5),
                backgroundColor: ColorManager.primary,
                content: const Text("حدث خطأ ما حاول مرة اخرى"),
              ),
            );
          }
        },
        builder: (context, state) {
          var cubit = UserCachingCubit.get(context);

          return Scaffold(
            body: GlobalPaddingWidget(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GlobalCircularButtonWidget(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            icon: Icons.arrow_back,
                          ),
                          Text(
                            "الحساب",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(width: AppSize.s30.w),
                        ],
                      ),
                      SizedBox(height: AppSize.s10.h),
                      GlobalUserCardWidget(radius: AppSize.s80.r),
                      Text(
                        cubit.cachedUserModel.userName,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: AppSize.s5.h),
                      Text(
                        "انضم منذ 12 اكتوبر 2024",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: AppSize.s20.h),
                      Divider(
                        color: ColorManager.socialButtonColor,
                        height: AppSize.s1.h,
                      ),
                      SizedBox(height: AppSize.s20.h),

                      // ====== Name ======
                      Row(
                        children: [
                          Text("الاسم بالكامل",
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          const Spacer(),
                        ],
                      ),
                      SizedBox(height: AppSize.s10.h),
                      GlobalTextFieldWidget(
                        validator: (val) {
                          if (val!.length < 10) {
                            return "ادخل الاسم بالكامل";
                          }
                          return null;
                        },
                        onSaved: (val) => name = val!,
                        controller: _nameController,
                        hintText: "الاسم بالكامل",
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: AppSize.s30.h),

                      // ====== Phone ======
                      Row(
                        children: [
                          Text("رقم الهاتف",
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          const Spacer(),
                        ],
                      ),
                      SizedBox(height: AppSize.s10.h),
                      GlobalTextFieldWidget(
                        validator: (value) {
                          if (value!.length != 11) {
                            return "ادخل رقم هاتف صحيح";
                          }
                          return null;
                        },
                        onSaved: (val) => phoneNumber = val!,
                        controller: _phoneController,
                        hintText: "رقم الهاتف",
                        textInputType: TextInputType.phone,
                      ),
                      SizedBox(height: AppSize.s30.h),

                      // ====== Location ======
                      Row(
                        children: [
                          Text("العنوان بالتفصيل",
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          const Spacer(),
                        ],
                      ),
                      SizedBox(height: AppSize.s10.h),
                      GlobalTextFieldWidget(
                        validator: (val) {
                          if (val!.length < 30) {
                            return "ادخل عنوانك بالتفصيل";
                          }
                          return null;
                        },
                        onSaved: (val) => location = val!,
                        controller: _locationController,
                        height: AppSize.s100.h,
                        hintText: "العنوان بالتفصيل",
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: AppSize.s20.h),

                      // ====== Update Button ======
                      if (state is UserCachingLoadingState)
                        const Center(child: GlobalLoadingIndicator())
                      else
                        Padding(
                          padding: EdgeInsets.all(AppSize.s10.r),
                          child: GlobalButtonWidget(
                            isButtonEnabled: isButtonEnabled,
                            text: "تحديث",
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                cubit.updateUser(
                                  cachedUserModel: CachedUserModel(
                                    userId: cubit.cachedUserModel.userId,
                                    userLocation: location,
                                    userName: name,
                                    phoneNumber: phoneNumber,
                                  ),
                                );
                              }
                            },
                            width: double.infinity,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    super.dispose();
  }
}
