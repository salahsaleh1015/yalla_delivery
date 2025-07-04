

import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/global_dialog.dart';
import 'package:delivery_app/presentation/views/user_views/views/main_layout/views/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void confirmOrderDialog(BuildContext context) {
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
    dialogTitle: "تم استلام طلبك!",
  );
}



class ConfirmOrderDialogContent extends StatelessWidget {
  const ConfirmOrderDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        vertical: AppPadding.p20.h,
      ),
      child: Text("سنراجع طلبك ونقبله في أسرع وقت ممكن.",
        style: Theme.of(context).textTheme.headlineSmall,),
    );
  }
}