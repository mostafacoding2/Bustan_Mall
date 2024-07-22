import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/core/utils/images_paths.dart';
import 'package:ultra_shop/features/Home/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({super.key});
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.primaryColor, boxShadow: [
        BoxShadow(                  offset: Offset(1, 1),
        blurRadius: 4,
        spreadRadius: 0,
        color: Color.fromRGBO(95, 159, 160, 1))]
    ),
      child: Row(
        children: [
          Spacer(),
          ClipRRect(borderRadius: BorderRadius.circular(360.r),
            child: Image.asset(fit: BoxFit.fill,
              ImagesPaths.logo,
              height: 70.h,
              width: 70.w,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            AppString.bUSTAN,
            style: lightTheme.textTheme.displaySmall!.apply(
              fontSizeFactor: 1.sp,
              color: AppColors.myWhite,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            AppString.mall,
            style: lightTheme.textTheme.displaySmall!.apply(
              fontSizeFactor: 1.sp,
              color: AppColors.myWhite,
            ),
          ),
          Spacer(
            flex: 8,
          ),
          (role == AppString.seller)?SizedBox(child:Text(role, style: lightTheme.textTheme.labelSmall!.apply(
            fontSizeFactor: 1.sp,
            color: AppColors.myWhite,
          ),)):
          Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(360.r)),
              child: IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(
                    Icons.search,
                    color: AppColors.myWhite,
                  ))),
          Spacer(flex: 2,),
        ],
      ),
    );
  }
}
