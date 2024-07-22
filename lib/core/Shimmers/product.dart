import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});
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
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    color: Colors.grey,
                    width: 60.w,
                    height: 60.h,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: [
                  Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,child: Icon(Icons.star,size: 34,)),
                  SizedBox(height: 10.h,),
                  Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,child: Container(width: 20,height: 10,color: Colors.grey,)),

                ],
              ),
            ],
          ),
              SizedBox(
                height: 10.h,
              ),
              Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,child: Container(height: 15,width: 160,                color: Colors.grey,
              )),
              SizedBox(
                height: 5.h,
              ),
          Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,child: Container(height: 15,width: 160,                color: Colors.grey,
          )),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
