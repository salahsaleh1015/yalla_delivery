import 'package:delivery_app/features/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalProfileCardWidget extends StatelessWidget {
  const GlobalProfileCardWidget({super.key, required this.fieldName, required this.fieldValue, this.height});
 final String fieldName;
  final String fieldValue;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GlobalDecoratedContainer(
      height:height ?? AppSize.s50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(fieldName,style: Theme.of(context).textTheme.headlineSmall,),
          SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: Text(fieldValue,
              maxLines: 3,
              textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: ColorManager.black
            ),),
          ),
        ],
      ),

    );
  }
}
