
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/presentation/views/user_views/views/on_boarding/widgets/on_boarding_body_one_widget.dart';
import 'package:delivery_app/presentation/views/user_views/views/on_boarding/widgets/on_boarding_body_two_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({
    super.key,
  });
  static String id = 'OnBoardingView';
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            ColorManager.lightPrimary,
            ColorManager.scaffoldBackgroundColor,
            ColorManager.scaffoldBackgroundColor,
          ],
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        )),
        child: PageView(
          controller:_pageController,
          scrollDirection: Axis.horizontal,
          children:  [
            OnBoardingBodyOneWidget(pageController: _pageController,),
           const  OnBoardingBodyTwoWidget(),
          ],
        ),
      ),
    );
  }
}
