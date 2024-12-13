import 'package:delivery_app/features/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalProfileCardWidget extends StatelessWidget {
  const GlobalProfileCardWidget({super.key, required this.fieldName, required this.fieldValue});
 final String fieldName;

  final String fieldValue;
  @override
  Widget build(BuildContext context) {
    return GlobalDecoratedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(fieldName,style: Theme.of(context).textTheme.headlineSmall,),
          Text(fieldValue,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: ColorManager.black
          ),),
        ],
      ),
      height: AppSize.s50.h,

    );
  }
}
