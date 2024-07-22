import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import '../../../../core/Theme/light_theme.dart';
class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key,this.onTap, required this.image,required this.title,this.isselected=false});
final String image;
final String title;
final bool isselected;
final  void Function()?onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: Container( width: 140,
        margin: EdgeInsets.symmetric(
            vertical: 10.h, horizontal: 30.w),
        padding: EdgeInsets.symmetric(
            vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(border: Border.all(color: isselected?AppColors.myGreen:AppColors.myDark,width:isselected?3:0.0023),
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.myWhite,
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(191, 214, 215, 1),
                  offset: Offset(1, 1),
                  spreadRadius: 0,
                  blurRadius: 4)
            ]),
        child: Column(
          children: [
            Image.asset(height: 120.h, width: 120.w, image,fit: BoxFit.scaleDown,),
            Text(title,style:
            lightTheme.textTheme.labelSmall!.apply(
              fontSizeFactor: 1.sp,
              color: AppColors.myDark,
            ))
          ],
        ),
      ),
    );;
  }
}
