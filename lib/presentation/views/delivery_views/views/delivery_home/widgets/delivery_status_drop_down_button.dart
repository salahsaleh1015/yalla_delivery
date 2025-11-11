import 'package:delivery_app/core/utils/constants.dart';
import 'package:delivery_app/presentation/view_models/delivery_view_models/delivery_info_cubit/delivery_info_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../core/utils/functions/local_delivery_account_data_functions.dart';
import '../../../../../../core/utils/functions/service_locator_setup.dart';
import '../../../../../../core/utils/popup_toast_helper.dart';
import '../../../../../../data/delivery_data/delivery_data_sources/local_data_sources/delivery_local_data_sources/delivery_account_local_data_source.dart';
import '../../../../../../domain/delivery_domain/delivery_repos/delivery_info_repo.dart';
import '../../../../../../domain/delivery_domain/delivery_usecases/delivery_edit_info_data_usecase.dart';
import '../../../../../../domain/delivery_domain/delivery_usecases/delivery_fetch_account_data_usecase.dart';
import '../../../../../../domain/delivery_domain/delivery_usecases/delivery_fetch_status_usecase.dart';
import '../../../../../models/dropdown_delivery_status_model.dart';

class DeliveryStatusDropDownButton extends StatefulWidget {
  const DeliveryStatusDropDownButton({super.key, required this.deliveryGmail});

  final String deliveryGmail;
  @override
  State<DeliveryStatusDropDownButton> createState() =>
      _DeliveryStatusDropDownButtonState();
}

class _DeliveryStatusDropDownButtonState
    extends State<DeliveryStatusDropDownButton> {
  DropdownDeliveryStatusModel selectedStatus = DeliveryStatusItems.available;
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
      ),
      child: BlocBuilder<DeliveryInfoCubit, DeliveryInfoStates>(
        builder: (context, state) {
          var cubit = DeliveryInfoCubit.get(context);
          if (state is DeliveryEditInfoLoadingState) {
            return const Center(
              child: GlobalLoadingIndicator(),
            );
          } else if (state is DeliveryEditInfoErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 3),
                backgroundColor: ColorManager.black,
                content: const Text('هناك خطأ ما، تأكد من اتصالك بالإنترنت.'),
              ),
            );
          }
          return DropdownButtonHideUnderline(
            child: DropdownButton2(
              items: [
                ...DeliveryStatusItems.statusItems.map((item) =>
                    DropdownMenuItem<DropdownDeliveryStatusModel>(
                      value: item,
                      child:
                          DeliveryStatusItems.buildItem(item, selectedStatus),
                    ))
              ],
              customButton: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s8.r),
                    color: ColorManager.arrowBackBackGroundColor),
                width: AppSize.s120.w,
                height: AppSize.s40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      AssetsManager.editIcon,
                      height: AppSize.s25.h,
                      width: AppSize.s25.w,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      selectedStatus.text,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Icon(
                      size: AppSize.s25.r,
                      Icons.arrow_drop_down_sharp,
                      color: ColorManager.black,
                    ),
                  ],
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                padding: EdgeInsets.only(
                    left: AppPadding.p16.w, right: AppPadding.p16.w),
              ),
              onChanged: (value) {
                setState(() {
                  selectedStatus = value!;
                  cubit.editDeliveryStatusByEmail(
                      email: widget.deliveryGmail,
                      deliveryStatus: selectedStatus.text);
                });
                DeliveryStatusItems.onChanged(context, value!);
              },
              dropdownStyleData: DropdownStyleData(
                width: AppSize.s250.w,
                padding: EdgeInsets.symmetric(vertical: AppPadding.p16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s25.r),
                  color: ColorManager.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

