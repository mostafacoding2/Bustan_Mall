import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomCancel extends StatelessWidget {
  const CustomCancel(
      {super.key,
        required this.onTap,
        required this.widget,
        this.isColored = true});
  final void Function()? onTap;
  final Widget widget;
  final bool isColored;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              color: isColored ? AppColors.myRed : AppColors.myGreen,
              borderRadius: BorderRadius.circular(20.r)),
          margin: EdgeInsets.only(left: 20.r, right: 20.r),
          width: 60.w,
          height: 40.h,
          child: widget),
    );
  }
}
