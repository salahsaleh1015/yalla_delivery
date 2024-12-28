import 'package:delivery_app/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalSearchCardItemWidget extends StatelessWidget {
  const GlobalSearchCardItemWidget({super.key, required this.hintText});

  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s55.h,
      width: double.infinity,
      child: GlobalDecoratedContainer(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p8.r),
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.only(
                bottom: AppPadding.p8.h,
              ),
              hintStyle: Theme.of(context).textTheme.labelSmall,
              prefixIcon: Icon(
                Icons.search,
                size: AppSize.s25.r,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
