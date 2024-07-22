import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/core/utils/shared%20_pref.dart';
import 'package:ultra_shop/features/Home/presentation/screens/bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_selected_role.dart';
class SelectRoleBody extends StatelessWidget {
  const SelectRoleBody({
    super.key,
    required this.number,
    required this.roles,
  });

  final int number;
  final List<String>? roles;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [SizedBox(height: 60.h,),
        Image.asset("assets/images/logo.png",height: 250.h,width: 250.w,fit: BoxFit.fill,),
        SizedBox(height: 40.h,),
        Text("Welcome to  ${AppString.bUSTAN}  ${AppString.mall}",
            style: lightTheme.textTheme.labelLarge!.apply(
              fontSizeFactor: 1.sp,
              color: AppColors.myRed,
            )),          SizedBox(height: 40.h,),

        Text("You Have $number role",
            style: lightTheme.textTheme.labelLarge!.apply(
              fontSizeFactor: 1.sp,
              color: AppColors.myOrange,
            )),
        SizedBox(height: 40.h,),
        Text("You can choose either of them",
            style: lightTheme.textTheme.labelLarge!.apply(
              fontSizeFactor: 1.sp,
              color: AppColors.myNavy,
            )),
        SizedBox(height: 40.h,),

        Padding(
          padding:  EdgeInsets.only(left: 15.0.r,right: 15.r),
          child: SizedBox(
              height: 70.h,
              child:  ListView.builder(scrollDirection: Axis.horizontal,
                itemCount: roles!.length,
                itemBuilder: (context, index) {
                  print("roles =======$roles");
                  return customSelectedRole(
                    text: roles![index],
                    onTap: () {
                      PreferenceUtils.setString(SharedKeys.role, roles![index]);
                      role = roles![index];
                      if (roles![index]=="User")
                      {
                        navigateAndRemove(context, BottomNavScreen(currentIndex:0 ,));
                      }
                      if (roles![index]=="Seller")
                      {
                        navigateAndRemove(context,  BottomNavScreen(currentIndex:0 ,));
                      }
                      if (roles![index]=="Admin")
                      {
                        navigateAndRemove(context,  BottomNavScreen(currentIndex:0 ,));
                      }


                    },
                  );

                },
              )),
        )
      ],
    );
  }
}
