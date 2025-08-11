import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/presentation/views/user_views/views/chat/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/values_manager.dart';
import '../../../../../models/message_model.dart';

class ChatMessagesView extends StatelessWidget {
  ChatMessagesView({
    super.key,
    required this.chatModel,
  });
  final ChatModel chatModel;

  CollectionReference message =
      FirebaseFirestore.instance.collection('Messages');
  TextEditingController messageController = TextEditingController();

  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: message.orderBy('time', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: ColorManager.scaffoldBackgroundColor,
                title: Text(
                  chatModel.deliveryName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                centerTitle: true,
                automaticallyImplyLeading: false,
                leading: GlobalCircularButtonWidget(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.arrow_back),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: scrollController,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) =>
                          messagesList[index].id == chatModel.phoneNumber
                              ? ChatBubbleForFriend(
                                  message: messagesList[index].message,
                                )
                              : ChatBubble(
                                  message: messagesList[index].message,
                                ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: TextField(
                      cursorColor: ColorManager.primary,
                      cursorHeight: AppSize.s25.h,
                      decoration: InputDecoration(

                        fillColor: ColorManager.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(
                          AppPadding.p8.r,
                        ),

                        hintText: 'اكتب رسالتك هنا',
                        hintStyle: Theme.of(context).textTheme.labelSmall,
                        suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.send,color: ColorManager.primary,size: AppSize.s25.r,),),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppSize.s15.r),
                            ),
                            borderSide: BorderSide(
                                color: ColorManager.socialButtonColor, width: AppSize.s1.w)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppSize.s15.r),
                            ),
                            borderSide:
                            BorderSide(color: ColorManager.primary, width: AppSize.s1.w)),
                      ),
                      controller: messageController,
                      onSubmitted: (data) {
                        message.add({
                          'message': data,
                          'time': DateTime.now(),
                          'id': chatModel.phoneNumber
                        });
                        messageController.clear();

                        scrollController.animateTo(
                            scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.fastOutSlowIn);
                      },

                    ),
                  )
                ],
              ),
            );
          } else {
            return const Scaffold(
                body: Center(
              child: Text("Loading..."),
            ));
          }
        });
  }
}

class ChatModel {
  final String phoneNumber;
  final String deliveryName;

  ChatModel({required this.phoneNumber, required this.deliveryName});
}
