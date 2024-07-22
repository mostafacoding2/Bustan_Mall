import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ultra_shop/features/splash/screens/splash_screen.dart';
import '../../../core/utils/app_color.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({
    super.key,
    required this.widget,
  });

  final SplashScreensAnimated widget;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 5000,
      splashIconSize: 400,
      splash: Container(
        height: 400.h,
        width: 300.w,
        child: Column(
          children: [
            LottieBuilder.asset('assets/Lottie/Animation - 1717252037956.json'),
          ],
        ),
      ),
      nextScreen: widget,
      backgroundColor: AppColors.myWhite,
    );
  }
}
