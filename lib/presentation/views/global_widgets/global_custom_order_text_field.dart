import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/values_manager.dart';
import 'global_text_field_widget.dart';

class GlobalCustomOrderTextField extends StatefulWidget {
  const GlobalCustomOrderTextField({
    super.key,
    required this.orderController,
    this.onSaved,
    this.validator,
  });

  final TextEditingController orderController;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  State<GlobalCustomOrderTextField> createState() =>
      _GlobalCustomOrderTextFieldState();
}

class _GlobalCustomOrderTextFieldState
    extends State<GlobalCustomOrderTextField> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    // delay بسيط عشان يدي effect حلو
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: _opacity == 0 ? const Offset(0, 0.1) : Offset.zero,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 400),
        opacity: _opacity,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: AppSize.s200.h,
          decoration: BoxDecoration(
            color: ColorManager.inputFillColor,
            borderRadius: BorderRadius.circular(AppSize.s8.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s8.r),
            child: GlobalTextFieldWidget(
              height: AppSize.s200.h,
              hintText: "اكتب تفاصيل طلبك هنا...",
              textInputType: TextInputType.multiline,
              controller: widget.orderController,
              onSaved: widget.onSaved,
              validator: widget.validator,
            ),
          ),
        ),
      ),
    );
  }
}
