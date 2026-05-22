import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/services/firebase_services/firestore_user_info_services.dart';
import 'package:delivery_app/data/models/delivery_model.dart';
import 'package:delivery_app/data/models/order_info_model.dart';
import 'package:delivery_app/data/models/order_model.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/user_caching_cubit/user_caching_cubit.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/user_orders_cubit/user_orders_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_app_bar.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/presentation/views/user_views/views/summary/summary_widgets/approve_order_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../data/models/approve_order_model.dart';
import '../../../../../domain/usecases/cache_user_usecase.dart';
import '../../../../../injection.dart';
import '../../../global_widgets/global_button_widget.dart';
import '../../../global_widgets/global_loading_indicator.dart';
import '../../../global_widgets/global_rrder_details_widget.dart';
import '../home/widgets/items/edit_location_card_item_widget.dart';
import '../home/widgets/items/notes_section_item_widget.dart';
import '../home/widgets/items/summary_delivery_item_widget.dart';
import 'package:intl/intl.dart';

class OrderSummaryView extends StatefulWidget {
  const OrderSummaryView({
    super.key,
    required this.orderInfoModel,
  });
  final OrderInfoModel orderInfoModel;

  @override
  State<OrderSummaryView> createState() => _OrderSummaryViewState();
}

class _OrderSummaryViewState extends State<OrderSummaryView> {
  String? userNote;
  String? userLocation;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCachingCubit(
          sl.get<CacheUserUseCase>(),
          sl.get<GetCachedUserUseCase>(),
          sl<UpdateCachedUserUseCase>(),
          sl<FirebaseUserServices>())
        ..loadCachedUser(),
      child: BlocBuilder<UserCachingCubit, UserCachingStates>(
        builder: (context, state) {
          var cacheCubit = UserCachingCubit.get(context);
          if (state is UserCachingLoadingState) {
            return const GlobalLoadingIndicator();
          } else if (state is UserCachingErrorState) {
            return Center(
                child: Text(
                  "هناك مشكلة حاول في وقت لاحق",
                  style: Theme.of(context).textTheme.headlineMedium,
                ));
          } else {
            return Scaffold(
              body: GlobalPaddingWidget(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalAppBar(
                        title: "ملخص الطلب",
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.mainLayoutRoute);
                        },
                      ),
                      SizedBox(height: AppSize.s30.h),
                      EditLocationCardItemWidget(
                        userPhone: cacheCubit.cachedUserModel.phoneNumber,
                        onLocationUpdated: (value) {
                          setState(() {
                            userLocation = value; // ← setState عشان يعمل rebuild
                          });
                        },
                      ),
                      SizedBox(height: AppSize.s15.h),
                      Text("تفاصيل الطلب",
                          style: Theme.of(context).textTheme.bodyMedium),
                      SizedBox(height: AppSize.s15.h),
                      GlobalOrderDetailsWidget(
                        orderDetails: widget.orderInfoModel.order,
                      ),
                      SizedBox(height: AppSize.s20.h),
                      Text("تفاصيل التوصيل",
                          style: Theme.of(context).textTheme.bodyMedium),
                      SizedBox(height: AppSize.s15.h),
                      SummaryDeliveryItemWidget(
                        deliveryName:
                        widget.orderInfoModel.deliveryModel.deliveryName,
                        deliveryRate:
                        widget.orderInfoModel.deliveryModel.deliveryRate,
                      ),
                      SizedBox(height: AppSize.s15.h),
                      NotesSectionItemWidget(
                        onSubmitted: (value) {
                          setState(() {
                            userNote = value; // ← setState هنا برضو
                          });
                        },
                      ),
                      SizedBox(height: AppSize.s20.h),
                      ApproveOrderButton(
                        approveOrderModel: ApproveOrderModel(
                          orderInfoModel: widget.orderInfoModel,
                          userCachingCubit: cacheCubit,
                          userNote: userNote ?? '',
                          userLocation: userLocation?.isNotEmpty == true
                              ? userLocation!
                              : cacheCubit.cachedUserModel.userLocation,
                        ),
                      ),
                      SizedBox(height: AppSize.s50.h),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}