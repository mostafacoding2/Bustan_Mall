import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class CustomloadingDetails extends StatelessWidget {
  const CustomloadingDetails({super.key, });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.r),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(color: Colors.grey[300]!,
              width: 100.w,
              height: 100.h,margin: EdgeInsets.all(30),

            ),
          ),
          SizedBox(
            width: 30.h,
          ),
          Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 244.w,
                  height: 30.h,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 44.w,
                  height: 8.h,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100.w,
          ),
          Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: SizedBox(
                height: 24.h,
                width: 24.w,
              )),
          Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: SizedBox(
                height: 24.h,
                width: 24.w,

              )),
          SizedBox(height: 16.h),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: 7.h,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4.h),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: 7.h,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4.h),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: 7.h,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4.h),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: 7.h,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.h),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
                width: 30.w, height: 5.h, color: AppColors.myWhite),
          ),
          SizedBox(width: 8.w),
          Row(
            children: [

              Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: SizedBox(
                    height: 24.h,
                    width: 24.w,
                  )),
              SizedBox(width: 50,),
              Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: SizedBox(
                    height: 50.h,
                    width: 40.w,
                    child:
                    Icon(Icons.shopping_cart_sharp, color: Colors.white),
                  )),

            ],
          )
        ],
      ),
    );
  }
}
