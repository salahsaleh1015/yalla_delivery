import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/functions/service_locator_setup.dart';
import '../../../../../../core/utils/popup_toast_helper.dart';
import '../../../../../../domain/delivery_domain/delivery_entities/delivery_account_entity.dart';
import '../../../../../../domain/delivery_domain/delivery_repos/delivery_info_repo.dart';
import '../../../../../../domain/delivery_domain/delivery_usecases/delivery_edit_info_data_usecase.dart';
import '../../../../../../domain/delivery_domain/delivery_usecases/delivery_fetch_account_data_usecase.dart';
import '../../../../../../domain/delivery_domain/delivery_usecases/delivery_fetch_status_usecase.dart';
import '../../../../../view_models/delivery_view_models/delivery_info_cubit/delivery_info_cubit.dart';
import '../../../../global_widgets/global_user_card_widget.dart';

class DeliveryEditAccountView extends StatefulWidget {
  const DeliveryEditAccountView({super.key, required this.deliveryAccount});

  final DeliveryInfoEntity deliveryAccount;

  @override
  State<DeliveryEditAccountView> createState() =>
      _DeliveryEditAccountViewState();
}

class _DeliveryEditAccountViewState extends State<DeliveryEditAccountView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  bool isButtonEnabled = false;

  void _checkIfFieldAreFilled() {
    final isFilled = nameController.text.isNotEmpty ||
        phoneController.text.isNotEmpty ||
        locationController.text.isNotEmpty;
    setState(() {
      isButtonEnabled = isFilled;
    });
  }

  @override
  void initState() {
    super.initState();
    nameController.addListener(_checkIfFieldAreFilled);
    phoneController.addListener(_checkIfFieldAreFilled);
    locationController.addListener(_checkIfFieldAreFilled);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // === Header ===
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GlobalCircularButtonWidget(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      icon: Icons.arrow_back,
                    ),
                    Text("الحساب",
                        style: Theme.of(context).textTheme.titleMedium),
                    SizedBox(width: AppSize.s30.w),
                  ],
                ),
                SizedBox(height: AppSize.s10.h),
                const GlobalUserCardWidget(radius: AppSize.s80),
                Text(widget.deliveryAccount.deliveryName,
                    style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: AppSize.s5.h),
                Text(widget.deliveryAccount.deliveryPhone,
                    style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(height: AppSize.s20.h),
                Divider(
                  color: ColorManager.socialButtonColor,
                  height: AppSize.s1.h,
                ),
                SizedBox(height: AppSize.s20.h),

                // === Full Name ===
                Row(
                  children: [
                    Text("الاسم بالكامل",
                        style: Theme.of(context).textTheme.headlineMedium),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: AppSize.s10.h),
                GlobalTextFieldWidget(
                  controller: nameController,
                  hintText: "الاسم بالكامل",
                  textInputType: TextInputType.text,
                  validator: (val) {
                    // optional validation
                    if (val != null && val.isNotEmpty && val.length < 5) {
                      return "ادخل الاسم بالكامل";
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSize.s30.h),

                // === Phone ===
                Row(
                  children: [
                    Text("رقم الهاتف",
                        style: Theme.of(context).textTheme.headlineMedium),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: AppSize.s10.h),
                GlobalTextFieldWidget(
                  controller: phoneController,
                  hintText: "رقم الهاتف",
                  textInputType: TextInputType.phone,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      final regex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');
                      if (!regex.hasMatch(value.trim())) {
                        return "أدخل رقم هاتف مصري صحيح مثل 01012345678";
                      }
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSize.s30.h),

                // === Location ===
                Row(
                  children: [
                    Text("العنوان",
                        style: Theme.of(context).textTheme.headlineMedium),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: AppSize.s10.h),
                GlobalTextFieldWidget(
                  controller: locationController,
                  hintText: "العنوان بالتفصيل",
                  textInputType: TextInputType.text,
                  height: AppSize.s100.h,
                  validator: (val) {
                    if (val != null && val.isNotEmpty && val.length < 10) {
                      return "ادخل عنوانك بالتفصيل";
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSize.s40.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BlocProvider(
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
        ),
        child: BlocConsumer<DeliveryInfoCubit, DeliveryInfoStates>(
          listener: (context, state) {
            if (state is DeliveryEditInfoSavedState) {
              Navigator.pushReplacementNamed(
                context,
                Routes.deliveryMainLayoutRoute,
                arguments: widget.deliveryAccount.deliveryMail,
              );
              showCustomToast(
                context,
                'تم التعديل بنجاح',
                backgroundColor: ColorManager.primary,
              );
            }
          },
          builder: (context, state) {
            var cubit = DeliveryInfoCubit.get(context);
            if (state is DeliveryEditInfoLoadingState) {
              return const Center(
                child: GlobalLoadingIndicator(),
              );
            } else if (state is DeliveryEditInfoErrorState) {
              return Center(
                  child: Text(
                "حدث خطأ ما حاول مره اخرى لاحقا",
                style: Theme.of(context).textTheme.headlineSmall,
              ));
            } else {
              return Padding(
                padding: EdgeInsets.all(AppSize.s10.r),
                child: GlobalButtonWidget(
                  isButtonEnabled: isButtonEnabled,
                  text: "تحديث",
                  onTap: isButtonEnabled
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            cubit.editDeliveryInfoByEmail(
                                email: widget.deliveryAccount.deliveryMail,
                                name: nameController.text,
                                location: locationController.text,
                                phoneNumber: phoneController.text,
                                deliveryStatus:
                                    widget.deliveryAccount.deliveryStatus);
                          }
                        }
                      : () {},
                  width: double.infinity,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    locationController.dispose();
    super.dispose();
  }
}
