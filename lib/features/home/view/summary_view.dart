import 'package:delivery_app/features/global_widgets/global_app_bar.dart';
import 'package:delivery_app/features/global_widgets/global_button_widget.dart';
import 'package:delivery_app/features/global_widgets/global_dialog.dart';
import 'package:delivery_app/features/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/features/home/widgets/items/edit_location_card_item_widget.dart';
import 'package:delivery_app/features/home/widgets/items/notes_section_item_widget.dart';
import 'package:delivery_app/features/home/widgets/items/summary_delivery_item_widget.dart';
import 'package:delivery_app/features/home/widgets/items/summary_details_item_widget.dart';
import 'package:delivery_app/features/main_layout/views/main_layout_view.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key});

  static String id = "SummaryView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GlobalAppBar(title: "ملخص الطلب"),
              SizedBox(
                height: AppSize.s30.h,
              ),
             const EditLocationCardItemWidget(),
              SizedBox(
                height: AppSize.s15.h,
              ),
              Text("تفاصيل الطلب",
                  style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(
                height: AppSize.s15.h,
              ),
              const SummaryDetailsItemWidget(),
              SizedBox(
                height: AppSize.s20.h,
              ),
              Text("تفاصيل التوصيل",
                  style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(
                height: AppSize.s15.h,
              ),
              const SummaryDeliveryItemWidget(),
              SizedBox(
                height: AppSize.s15.h,
              ),
             const NotesSectionItemWidget()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.all(AppPadding.p8.r),
        child: GlobalButtonWidget(
          text: "تأكيد الطلب",
          onTap: () {
            showCustomDialog(
              context,
              content: const ConfirmOrderDialogContent(),
              actionButtonCallBack: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MainLayoutView.id,
                      (Route<dynamic> route) => false,
                );
              },
              actionButtonHint: "الرئيسية",
              dialogTitle: "تغيير موقع التوصيل",
            );
          },
          width: double.infinity,
        ),
      ),
    );
  }
}

class ConfirmOrderDialogContent extends StatelessWidget {
  const ConfirmOrderDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("سنراجع طلبك ونقبله في أسرع وقت ممكن.",
      style: Theme.of(context).textTheme.headlineSmall,);
  }
}
