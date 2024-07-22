import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shop/core/utils/app_color.dart';

import '../../../../core/Theme/light_theme.dart';

class ItemTextProfile extends StatelessWidget {
  const ItemTextProfile({super.key, required this.title,required this.content});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return           Padding(
      padding:  EdgeInsets.only(bottom:15.0.h),
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(right: 20),
            child: Text(
              title,
              style: lightTheme.textTheme.labelSmall!.apply(
                fontSizeFactor: 1.sp,
                color: AppColors.myDark,
              ),
            ),
          ),


          Expanded(
            child: Text(
              content,
              style: lightTheme.textTheme.labelSmall!.apply(
                fontSizeFactor: 1.sp,
                color: AppColors.myNavy,
              ),
            ),
          ),
        ],
      ),
    );
  }
}