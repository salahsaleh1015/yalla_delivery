import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_circular_button_widget.dart';
import '../../../../global_widgets/global_decorated_container.dart';
import '../../../../global_widgets/global_padding_widget.dart';
import '../../../../global_widgets/global_search_card_item_widget.dart';
import '../../cart/views/cart_view.dart';
import '../widgets/chat_tile_widget.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: AppSize.s30.w,
                ),
                Text(
                  "كل المندوبين",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                GlobalCircularButtonWidget(
                  onTap: () {
                    Navigator.pushNamed(context, CartView.id);
                  },
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s30.h,
            ),
            const GlobalSearchCardItemWidget(
              hintText: 'بحث',
            ),
            SizedBox(
              height: AppSize.s30.h,
            ),
            GlobalDecoratedContainer(
                child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => const ChatTileWidget(),
              itemCount: 10,
            )),
            SizedBox(
              height: AppSize.s30.h,
            )
          ],
        ),
      )),
    );
  }
}
