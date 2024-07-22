import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NavigationText extends StatelessWidget {
  const NavigationText({super.key, required this.text, required this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
          onTap: onTap,
          child: FittedBox(fit:BoxFit.scaleDown,child: Text(text,style:
          lightTheme.textTheme.labelSmall!.apply(
            fontSizeFactor: 1.sp,
            color: AppColors.myBlue,
          ),)));
  }
}