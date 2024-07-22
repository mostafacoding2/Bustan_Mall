import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key, required this.title, required this.seeMore, required this.onPressed,  this.arrow=false});
  final String title;
  final String seeMore;
  final bool arrow;
  final void Function()?onPressed;
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.only(left: 10.w,right: 12.w,top:10.h,bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(flex: 1),
          Text(
           title ,
            style: lightTheme.textTheme.labelLarge!.apply(
              fontSizeFactor: 1.sp,
              color: AppColors.primaryColor,
            ),
          ),
          Spacer(flex: 10,),
          Text(
            seeMore,
            style: lightTheme.textTheme.labelSmall!.apply(
              fontSizeFactor: 1.sp,
              color: AppColors.myMutedBlue,
            ),
          ),
          Spacer(flex: 1),
          GestureDetector(onTap:onPressed,child: Container(alignment: Alignment.center,  height: 35.h,width: 35.w, decoration:BoxDecoration(color:AppColors.myDarkGrey ,borderRadius: BorderRadius.circular(90.r)),child:arrow?Icon(Icons.keyboard_arrow_down_outlined,size: 37,):  Icon(Icons.arrow_forward_ios_sharp,),)),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
