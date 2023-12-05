import 'package:flutter/material.dart';
import 'package:todo_api/models/onboarding_model.dart';
import 'package:todo_api/res/app_color.dart';
import 'package:todo_api/res/app_style.dart';
import 'package:todo_api/screens/login_sign_in/login_screen.dart';
import 'package:todo_api/screens/onboarding/widgets/page_index.dart';
import 'package:todo_api/screens/onboarding/widgets/skip_page.dart';
import 'package:todo_api/screens/onboarding/widgets/slider_onboarding.dart';
import 'package:todo_api/utils/utils.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.h_3A87F3,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: SiderOnboarding(
                controller: _pageController,
                itemCount: listOnboardingModel.length,
                current: current,
                onPageChanged: (value) {
                  setState(() {
                    current = value;
                  });
                },
                backGround: listOnboardingModel[current].backGround,
                image: listOnboardingModel[current].image),
          ),
          Positioned(
              top: 70.0,
              right: 30.0,
              child: SkipPage(
                label: 'Skip',
                fontSize: 16.0,
                iconSize: 22.0,
                onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false),
              )),
          Positioned(
            top: Util.caculatorHeight(context, 600.0),
            left: 45.0,
            child: Text(
              listOnboardingModel[current].title ?? '',
              style: AppStyle.s16_w400_w.copyWith(fontSize: 30.0),
            ),
          ),
          Positioned(
            top: Util.caculatorHeight(context, 650.0),
            left: 45.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width -
                  90, // Width of the text container
              child: Text(
                listOnboardingModel[current].subTitle ?? '',
                style: AppStyle.s16_w400_w.copyWith(fontSize: 20.0),
                softWrap: true, // Allow text to wrap into multiple lines
                overflow: TextOverflow.clip, // Clip overflowed text
              ),
            ),
          ),
          Positioned(
            top: Util.caculatorHeight(context, 740.0),
            child: PageIndex(
              current: current,
              itemCount: listOnboardingModel.length,
            ),
          ),
          Positioned(
            bottom: Util.caculatorHeight(context, 58.0),
            child: SkipPage(
                label: current ==2 ? 'Let’s go' : 'Next',
                fontSize: 24.0,
                iconSize: 26.0,
                onTap: () => current == 2
                    ? Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false)
                    : _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      )),
          ),
        ],
      ),
    );
  }
}
