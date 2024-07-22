import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomButton extends StatelessWidget {
  const CustomButton( {super.key,required this.onTap,  this.isLoading=false, required this.title});
  final void Function()?onTap;
final bool isLoading;
final String title;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(onTap: onTap,
      child: Container(decoration: BoxDecoration(color:AppColors.primaryColor,borderRadius: BorderRadius.circular(20.r)),
        margin: EdgeInsets.only(left: 20.r,right: 20.r),
        width: 270.w,height: 65.h,
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(color: AppColors.myWhite)
              : Text(
            title,
            style: lightTheme.textTheme.labelLarge!.apply(
              fontSizeFactor: 1.sp,
              color: AppColors.myWhite,
            ),
          ),
        ),
      ),
    );
  }
}
