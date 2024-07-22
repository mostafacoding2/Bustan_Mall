
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/core/utils/shared%20_pref.dart';
import 'package:ultra_shop/features/Account/presentation/screens/login_screen.dart';
import 'package:ultra_shop/features/Home/presentation/screens/bottom_nav_screen.dart';
import 'package:flutter/material.dart';

import 'package:ultra_shop/features/splash/widgets/slpash_body.dart';
class SplashScreensAnimated extends StatefulWidget {
  const SplashScreensAnimated({super.key});
  @override
  State<SplashScreensAnimated> createState() => _SplashScreensAnimatedState();
}
class _SplashScreensAnimatedState extends State<SplashScreensAnimated> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigationTo();
}
void navigationTo() {
  token = PreferenceUtils.getString(SharedKeys.token,);
  final Widget widget;
  (token == '')
      ? widget = const LoginScreen()
      : widget =  BottomNavScreen(currentIndex: 0);
  Future.delayed(const Duration(milliseconds: 5000 ), () {navigateAndRemove(context, widget);});
}
  @override
  Widget build(BuildContext context) {
    return  SplashScreenBody(widget: widget);
  }
}


