



import 'package:delivery_app/presentation/features/views/cart/views/cart_view.dart';
import 'package:delivery_app/presentation/features/views/chat/widgets/chat_tile_widget.dart';
import 'package:delivery_app/presentation/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/presentation/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/presentation/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/presentation/global_widgets/global_search_card_item_widget.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class DeliveryChatView extends StatelessWidget {
  const DeliveryChatView({super.key});
static  String id = 'DeliveryChatView';
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
