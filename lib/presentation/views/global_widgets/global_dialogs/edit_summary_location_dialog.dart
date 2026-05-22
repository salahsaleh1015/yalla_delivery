import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/global_dialog.dart';

import 'package:delivery_app/presentation/views/global_widgets/global_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/values_manager.dart';

void editSummaryLocationDialog(
  BuildContext context,
{required ValueChanged<String> onLocationChanged,String initialLocation = ''}
) {
  showCustomDialog(
    context,
    content: EditSummaryLocationDialogContent(
      initialLocation: initialLocation,
      onSubmitted: (value) {
        onLocationChanged(value); // ✅ بيبعت القيمة لبره
      },
    ),
    actionButtonHint: "عدل",
    dialogTitle: "تعديل موقعك ",
  );
}

class EditSummaryLocationDialogContent extends StatefulWidget {
  const EditSummaryLocationDialogContent({super.key, this.onSubmitted , this.initialLocation = '',});
  final ValueChanged<String>? onSubmitted;
  final String initialLocation;


  @override
  State<EditSummaryLocationDialogContent> createState() =>
      _EditSummaryLocationDialogContentState();
}

class _EditSummaryLocationDialogContentState
    extends State<EditSummaryLocationDialogContent> {
  final TextEditingController _locationController = TextEditingController();
  bool isButtonEnabled = false;
  String submittedText = '';

  void _checkIfFieldsAreFilled() {
    final isFilled = _locationController.text.isNotEmpty;

    setState(() {
      isButtonEnabled = isFilled;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _locationController.text = widget.initialLocation;
    _locationController.addListener(_checkIfFieldsAreFilled);
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.s10.h,
            ),
            Text(
              "موقعك الحالي ",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            GlobalTextFieldWidget(
              validator: (val) {
                if (val!.length < 30) {
                  return "ادخل عنوانك بالتفصيل";
                }
                return null;
              },
              controller: _locationController,
              height: AppSize.s80.h,
              hintText: "أدخل عنوانك",
              textInputType: TextInputType.multiline,
            ),
            SizedBox(
              height: AppSize.s20.h,
            ),
            GlobalButtonWidget(
                isButtonEnabled: isButtonEnabled,
                width: double.infinity,
                text: "متابعة",
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    final text = _locationController.text.trim(); // ← احفظها محليًا أولاً
                    setState(() {
                      submittedText = text;
                    });
                    widget.onSubmitted?.call(text); // ← ابعت النسخة المحلية مش submittedText
                    Navigator.pop(context);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
