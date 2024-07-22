import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomAppBarOrderScreen extends StatelessWidget {
  const CustomAppBarOrderScreen({super.key, required this.title, this.onpressed,this.onpressed1,this.isShowed=false,this.arrow_back=false,  this.icondata});
  final String title;
  final void Function()? onpressed;
  final void Function()? onpressed1;
  final Widget ?icondata;
  final bool isShowed ;
  final bool arrow_back;
  @override
  Widget build(BuildContext context) {
    return    SafeArea(
      child: Container(
        height: 70.h,width:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),color: AppColors.primaryColor),
        child: Row(children: [
          SizedBox(width: 10.w,),
          arrow_back?  IconButton(
              onPressed: onpressed,
              icon: Icon(Icons.arrow_back,color:AppColors.myWhite)):SizedBox(),
          SizedBox(width: 10.w,),
          Text(title,style: lightTheme.textTheme.displayLarge!.apply(
            fontSizeFactor: 1.sp,
            color: AppColors.myWhite,
          ),),Spacer(flex: 6,),
      
          isShowed? GestureDetector(onTap:onpressed1 ,child:icondata,):SizedBox()
      
        ],),
      ),
    );
  }
}
