import 'package:delivery_app/presentation/delivery_features/views/delivery_main_layout/cubit/delivery_main_layout_cubit.dart';
import 'package:delivery_app/presentation/global_widgets/global_bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DeliveryMainLayoutView extends StatelessWidget {
  const DeliveryMainLayoutView({super.key});

  static String id = 'DeliveryMainLayoutView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeliveryMainLayoutCubit(),
      child: BlocBuilder<DeliveryMainLayoutCubit, DeliveryMainLayoutStates>(
        builder: (context, state) {
          var cubit = DeliveryMainLayoutCubit.get(context);
          return Scaffold(
            body: cubit.deliveryScreens[cubit.currentIndex],
            bottomNavigationBar: GlobalBottomNavBarWidget(
              initialActiveIndex: cubit.currentIndex,
              items: cubit.deliveryBottomNavTabs,
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
