import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_api/gen/assets.gen.dart';
import 'package:todo_api/res/app_color.dart';
import 'package:todo_api/screens/onboarding/onboarding_screen.dart';
import 'package:todo_api/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int time = -1;
  bool isLogoCompleted = false;
  @override
  void initState() {
    super.initState();
    setTime(0, const Duration(seconds: 0));
    setTime(1, const Duration(seconds: 1));
    setTime(2, const Duration(seconds: 2));
  }

  void setTime(int value, Duration duration) {
    Timer(duration, () {
      setState(() {
        time = value;
        if (value == 1) {
          isLogoCompleted = true;
        }
      });
      if (value == 2) {
        _navigateToLoginScreen();
      }
    });
  }

  void _navigateToLoginScreen() {
    Future.delayed(
      const Duration(milliseconds: 500),
      () => Navigator.of(context).pushAndRemoveUntil(
        PageTransition(
            curve: Curves.decelerate,
            duration: const Duration(milliseconds: 500),
            child: const OnboardingScreen(),
            type: PageTransitionType.fade),
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: time == 0
                ? AppColor.gradient1
                : time == 1
                    ? AppColor.gradient2
                    : AppColor.gradient3),
        curve: Curves.easeInOut,
        duration: const Duration(
          seconds: 2,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
                curve: Curves.decelerate,
                bottom:
                    time == -1 ? -650 : Util.caculatorHeight(context, 432.0),
                duration: const Duration(seconds: 1),
                child: SvgPicture.asset(Assets.images.logoSvg, width: 188.0)),
            AnimatedPositioned(
                curve: Curves.decelerate,
                bottom: isLogoCompleted
                    ? Util.caculatorHeight(context, 400.0)
                    : -650.0,
                duration: const Duration(seconds: 1),
                child: SvgPicture.asset(Assets.images.planitSvg, width: 99)),
          ],
        ),
      ),
    );
  }
}
