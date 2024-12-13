import 'package:delivery_app/features/global_widgets/global_button_widget.dart';
import 'package:delivery_app/features/global_widgets/global_decorated_bottom_container.dart';
import 'package:delivery_app/features/home/view/choose_delivery_view.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/routes_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceCardItemWidget extends StatelessWidget {
  const PriceCardItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalDecoratedBottomContainer(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p10.r),
        child: Row(
          children: [
            Text(
              "السعر",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: ColorManager.primary),
            ),
            SizedBox(
              width: AppSize.s10.w,
            ),
            Text(
              r"$100",
              style: Theme.of(context).textTheme.displayMedium,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            GlobalButtonWidget(
              text: "استمر",
              onTap: () {
                Navigator.pushNamed(context, ChooseDeliveryView.id);
              },
              width: AppSize.s180.w,
            )
          ],
        ),
      ),
    );
  }
}
