import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomDetailsShop extends StatelessWidget {
  const CustomDetailsShop({super.key, required this.title, required this.content});
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return             Padding(
      padding:  EdgeInsets.only(top:8.0.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("$title:",style: lightTheme.textTheme.labelMedium!.apply(
            fontSizeFactor: 1.sp,
            color: AppColors.myNavy,
          ),
          ),SizedBox(width: 10.w,),
          Expanded(
            child: Text(content,style: lightTheme.textTheme.labelMedium!.apply(
              fontSizeFactor: 1.sp,
              color: AppColors.primaryColor,
            ),
            ),
          ),
        ],
      ),
    );

  }
}