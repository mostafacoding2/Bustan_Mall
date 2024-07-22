import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/core/utils/shared%20_pref.dart';
import 'package:ultra_shop/features/Account/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ItemSigOut extends StatelessWidget {
  const   ItemSigOut({super.key,required  this.title});
  final  String title;
  @override
  Widget build(BuildContext context,) {
    return
      AlertDialog(
          backgroundColor: AppColors.myWhite,
          content:Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            height: 200.h,
            width: 327.w,
            child: Column(
              children: [
                Text("Warning",style: lightTheme.textTheme.labelMedium!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.primaryColor,
                ),),
                SizedBox(height: 53.h,),
                Text(title,
                  style: lightTheme.textTheme.displaySmall!.apply(
                    fontSizeFactor: 1.sp,
                    color: AppColors.myDark,
                  ),),
                Spacer(),
                Row(children:
                [const Spacer(),
                  InkWell(onTap: ()
                  {
                    PreferenceUtils.removeData(SharedKeys.token);
                    PreferenceUtils.removeData(SharedKeys.role);
                    PreferenceUtils.removeData(SharedKeys.customerId);
                    PreferenceUtils.removeData(SharedKeys.userName);
                    navigateAndRemove(context, LoginScreen());
                         },
                    child: Container(padding: EdgeInsets.all(10.r),
                      height:40.w,decoration: BoxDecoration(color:AppColors.myRed,borderRadius: BorderRadius.circular(12.r)),
                      child: Center(
                        child: Text("Sure",style: lightTheme.textTheme.labelMedium!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.myWhite,
                        )),
                      ),
                    ),
                  ),
                  Spacer(flex: 4,),
                  InkWell(onTap: ()
                  {
                    Navigator.of(context).pop(false);                             },
                    child: Container
                      (padding: EdgeInsets.all(10.r),
                      height: 40.h,decoration: BoxDecoration(color:AppColors.myBlueGrey,borderRadius: BorderRadius.circular(12.r)),
                      child: Center(
                          child: Text("Cancel",style: lightTheme.textTheme.labelMedium!.apply(
                            fontSizeFactor: 1.sp,
                            color: AppColors.myWhite,
                          ))),
                    ),
                  ),
                  SizedBox(width: 24.h,),
                ],),
                SizedBox(height: 22.h,),
              ],),
          )
      ) ;}
}
