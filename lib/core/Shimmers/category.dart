import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.only(top: 10.h, bottom: 10.h, left: 8.w, right: 8.w),
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.myWhite,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(191, 214, 215, 1),
                offset: Offset(1, 4),
                spreadRadius: 0,
                blurRadius: 1)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(360),
              child: Container(
                color: Colors.grey,
                width: 100.w,
                height: 100.h,
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,child: Container(
            color: Colors.grey,

            height: 15,width: 60,)),
          SizedBox(
            height: 10.h,
          ),
          Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,child: Container(height: 15,width: 60,                color: Colors.grey,
          )),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
