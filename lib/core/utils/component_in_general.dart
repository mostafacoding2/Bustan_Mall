import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({ super.key,this.onTap,this.onChanged  ,this.controller,  this.label='',required this.obscureText, this.validator,  this.widget= const Icon(Icons.add,color: Colors.white,),  this.hintText, required this.keyboardType,  this.readOnly=false});
  final  TextEditingController ?controller;
final  void Function()?onTap;
  final  String ?label;
   final  String ?hintText;
  final  String? Function(String?)? validator;
  final bool obscureText;
  final Widget? widget;
  final   TextInputType  keyboardType;
 final  bool readOnly ;
   void Function(String)?onChanged;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(onChanged:onChanged ,
      onTap: onTap,
      controller: controller,
        keyboardType:keyboardType,
      readOnly: readOnly,
        style:lightTheme.textTheme.labelMedium!.apply(
          fontSizeFactor: 1.sp,
          color: AppColors.myDark,
        ),
      decoration: InputDecoration(
          suffix:widget,
          contentPadding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
          labelText: label,
          hintText: hintText
        ,hintStyle:lightTheme.textTheme.labelMedium!.apply(
        fontSizeFactor: 1.sp,
        color: AppColors.myDark,
      ),
          labelStyle: lightTheme.textTheme.labelMedium!.apply(
            fontSizeFactor: 1.sp,
            color: AppColors.myDark,
          ),errorStyle:  lightTheme.textTheme.labelMedium!.apply(
        fontSizeFactor: 1.sp,
        color: AppColors.myRed,
      ),
          border:  OutlineInputBorder(borderRadius: BorderRadius.circular(16.r),borderSide: BorderSide(color:AppColors.myDark)),
          enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(16.r),borderSide: BorderSide(color:AppColors.myGrey)),
          focusedErrorBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(16.r),borderSide: BorderSide(color:AppColors.myRed)),
          errorBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(16.r),borderSide: BorderSide(color:AppColors.myRed)),
          focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(16.r),borderSide: BorderSide(color:AppColors.myBlue))
      ),
      obscureText: obscureText,
      validator: validator,
    );
  }
}