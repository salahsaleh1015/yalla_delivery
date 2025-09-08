import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotesSectionItemWidget extends StatefulWidget {
  const NotesSectionItemWidget({super.key, this.onSubmitted});
  final ValueChanged<String>? onSubmitted;
  @override
  State<NotesSectionItemWidget> createState() => _NotesSectionItemWidgetState();
}

class _NotesSectionItemWidgetState extends State<NotesSectionItemWidget> {
  final TextEditingController _controller = TextEditingController();
  bool isEditing = true;
  String submittedText = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: ColorManager.white,
      elevation: AppSize.s5.r,
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p8.r),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: isEditing
              ? TextField(
                  controller: _controller,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 1,
                  onChanged: (text) {
                    setState(() {}); // To update the icon when typing starts
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: AppPadding.p8.h),
                    border: InputBorder.none,
                    prefixIcon: _controller.text.isEmpty
                        ? Icon(
                            Icons.mode_edit_outline_outlined,
                            size: AppSize.s25.r,
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.send,
                              size: AppSize.s25.r,
                              color: ColorManager.primary,
                            ),
                            onPressed: () {
                              setState(() {
                                submittedText = _controller.text.trim();
                                isEditing = false;
                              });
                              widget.onSubmitted?.call(submittedText); // <-- Trigger callback
                            },
                          ),
                    hintText: "هل هناك ملاحظات حول الاستلام؟",
                    hintStyle: Theme.of(context).textTheme.headlineSmall,
                  ),
                )
              : Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: AppSize.s25.r,
                        color: Colors.blueGrey,
                      ),
                      onPressed: () {
                        setState(() {
                          isEditing = true;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        submittedText,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
