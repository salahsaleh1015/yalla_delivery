import 'package:delivery_app/presentation/global_widgets/global_admin_add_button_widget.dart';
import 'package:delivery_app/presentation/global_widgets/global_dialogs/add_ads_dialoge.dart';
import 'package:flutter/material.dart';

class AddAdsBar extends StatelessWidget {
  const AddAdsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "شركاء الاعلانات",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        GlobalAdminAddButtonWidget(
          text: "إضافة شريك الإعلان",
          onTap: () {
            addAdsDialog(context);
          },
        ),
      ],
    );
  }
}
