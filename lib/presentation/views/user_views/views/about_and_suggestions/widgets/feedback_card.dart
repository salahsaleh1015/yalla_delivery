// ─── FEEDBACK CARD ────────────────────────────────────────
import 'package:delivery_app/core/utils/functions/service_locator_setup.dart';
import 'package:delivery_app/core/utils/popup_toast_helper.dart';
import 'package:delivery_app/data/repos/feedback_repos/feedback_repo.dart';
import 'package:delivery_app/domain/entities/feed_back_entity/feed_back_entity.dart';
import 'package:delivery_app/domain/usecases/feedback_usecase/feedback_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/add_feedback_cubit/add_feedback_cubit.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/add_feedback_cubit/add_feedback_state.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors_manager.dart';

class FeedbackCard extends StatefulWidget {

  final FocusNode feedbackFocusNode;
  final FocusNode titleFocusNode;
  final double cardPadding;
  final double titleFontSize;
  final double bodyFontSize;
  final int maxLines;

  FeedbackCard({
    required this.feedbackFocusNode,
    required this.cardPadding,
    required this.titleFontSize,
    required this.bodyFontSize,
    required this.maxLines,
    required this.titleFocusNode,
  });

  @override
  State<FeedbackCard> createState() => FeedbackCardState();
}

class FeedbackCardState extends State<FeedbackCard> {
  bool _isFocused = false;
  bool _isTitleFocused = false;
  bool _isButtonEnabled = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController feedbackController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  void _checkIfFieldsAreFilled() {
    final isFilled = feedbackController.text.isNotEmpty &&
       titleController.text.isNotEmpty;

    setState(() {
      _isButtonEnabled = isFilled;
    });
  }

  @override
  void initState() {
    super.initState();
    titleController.addListener(_checkIfFieldsAreFilled);
    feedbackController.addListener(_checkIfFieldsAreFilled);
    widget.titleFocusNode.addListener(() {
      if (mounted)
        setState(() => _isTitleFocused = widget.titleFocusNode.hasFocus);
    });
    widget.feedbackFocusNode.addListener(() {
      if (mounted)
        setState(() => _isFocused = widget.feedbackFocusNode.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Container(
      padding: EdgeInsets.all(widget.cardPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 0.8),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "يسعدنا أن نسمع منك",
              style: TextStyle(
                fontSize: widget.titleFontSize,
                fontWeight: FontWeight.w600,
                color: ColorManager.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'تساعدنا اقتراحاتكم على النمو والتطور يومياً.',
              style: TextStyle(
                fontSize: widget.bodyFontSize - 1,
                color: ColorManager.secondaryTextColor,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),

            // ── Text Field ────────────────────────────────
            Column(
              children: [
                /// 🔹 Title Field (صغير)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: ColorManager.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _isTitleFocused
                          ? ColorManager.primary
                          : Colors.grey.shade200,
                      width: _isTitleFocused ? 1.5 : 1.0,
                    ),
                  ),
                  child: TextField(
                    controller:titleController,
                    focusNode: widget.titleFocusNode,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16.sp, // 👈 حجم الخط
                      fontWeight: FontWeight.w400, // أصغر شوية
                      color: ColorManager.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'عنوان الاقتراح...',
                      hintStyle: TextStyle(
                        fontSize: widget.bodyFontSize - 2,
                        color: ColorManager.hintColor,
                      ),
                      prefixIcon: Icon(
                        Icons.title_rounded,
                        color: _isTitleFocused
                            ? ColorManager.primary
                            : ColorManager.hintColor,
                        size: isTablet ? 20 : 18,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),

                /// 🔹 Details Field (بتاعك زي ما هو)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: ColorManager.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _isFocused
                          ? ColorManager.primary
                          : Colors.grey.shade200,
                      width: _isFocused ? 1.5 : 1.0,
                    ),
                  ),
                  child: TextField(
                    controller: feedbackController,
                    focusNode: widget.feedbackFocusNode,
                    maxLines: widget.maxLines,
                    style: TextStyle(
                      fontSize: 16.sp, // 👈 حجم الخط
                      fontWeight: FontWeight.w400, // أصغر شوية
                      color: ColorManager.black,
                    ),
                    decoration: InputDecoration(
                      hintText:
                          'تساعدنا اقتراحاتكم على النمو والتطور يوميا....',
                      hintStyle: TextStyle(
                        fontSize: widget.bodyFontSize,
                        color: ColorManager.hintColor,
                      ),
                      prefixIcon: Padding(
                        padding:
                            const EdgeInsets.only(left: 12, right: 8, top: 12),
                        child: Icon(
                          Icons.chat_bubble_outline_rounded,
                          color: _isFocused
                              ? ColorManager.primary
                              : ColorManager.hintColor,
                          size: isTablet ? 20 : 18,
                        ),
                      ),
                      prefixIconConstraints:
                          const BoxConstraints(minWidth: 0, minHeight: 0),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.fromLTRB(0, 12, 14, 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // ── Send Button ───────────────────────────────
            BlocProvider<AddFeedbackCubit>(
              create: (context) => AddFeedbackCubit(
                  AddFeedbackUseCase(getIt.get<FeedBackRepoImpl>())),
              child: BlocConsumer<AddFeedbackCubit, AddFeedbackStates>(
                listener: (context, state) {
                 if(state is AddFeedbackSuccessState){
                   showCustomToast(context, "تم الارسال بنجاح",type: ToastType.success);

                 }
                 if(state is AddFeedbackErrorState){
                   showCustomToast(context, "حدث خطا ما",type: ToastType.error);
                 }
                },
                builder: (context, state) {
                  return state is AddFeedbackLoadingState?Center(
                    child: GlobalLoadingIndicator(),
                  ) : SizedBox(
                    width: double.infinity,
                    child: GlobalButtonWidget(
                      isButtonEnabled: _isButtonEnabled,
                      width: double.infinity,
                      onTap: () async{
                        if (_formKey.currentState!.validate()) {

                        await AddFeedbackCubit.get(context).addFeedBack(feedback: FeedBackEntity(
                            feedbackTitle: titleController.text,
                            feedbackId: "",
                            feedbackDetails: feedbackController.text,
                          ));

                          print(titleController.text);
                         titleController.clear();
                         feedbackController.clear();
                          widget.titleFocusNode.unfocus();
                          widget.feedbackFocusNode.unfocus();
                        }
                      },

                      text: 'إرسال الملاحظات',
                      // style: ElevatedButton.styleFrom(
                      //   backgroundColor: ColorManager.primary,
                      //   foregroundColor: Colors.white,
                      //   elevation: 0,
                      //   padding: EdgeInsets.symmetric(
                      //       vertical: isTablet ? 16 : 14),
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(12)),
                      // ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
