import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfile extends StatelessWidget {
  const CustomProfile({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return   Container(
      child: widget, margin: EdgeInsets.symmetric(
        vertical: 10.h, horizontal: 10.w),
      padding: EdgeInsets.symmetric(
          vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.myWhite,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(191, 214, 215, 0.6),
                offset: Offset(1, 1),
                spreadRadius: 0,
                blurRadius: 4)
          ]),
    );
  }
}