import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_color.dart';

class OrderShimmer extends StatelessWidget {
  const OrderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
        EdgeInsets.only(top: 10.h, bottom: 10.h, left: 8.w, right: 8.w),
        margin: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
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
        child:Column(children: [

          Container(  padding:
          EdgeInsets.only(top: 10.h, bottom: 10.h, left: 8.w, right: 8.w),
            margin: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
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
                Row(children: [
                  Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 5.h,
                        width: 20.w,
                        color: Colors.grey,
                      )),SizedBox(width: 10,),
                  Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 5.h,
                        width: 200.w,
                        color: Colors.grey,
                      )),

                ],),
                SizedBox(height: 10,),
                Row(children: [
                  Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 5.h,
                        width: 20.w,
                        color: Colors.grey,
                      )),SizedBox(width: 10,),
                  Column(
                    children: [
                      Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 5.h,
                            width: 200.w,
                            color: Colors.grey,
                          )),SizedBox(height: 10.h,),
                      Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 5.h,
                            width: 200.w,
                            color: Colors.grey,
                          )),
                      SizedBox(height: 10.h,),
                      Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 5.h,
                            width: 200.w,
                            color: Colors.grey,
                          )),
                    ],
                  ),

                ],),
                SizedBox(height: 10,),
                Row(children: [
                  Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 5.h,
                        width: 20.w,
                        color: Colors.grey,
                      )),SizedBox(width: 10,),
                  Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 5.h,
                        width: 200.w,
                        color: Colors.grey,
                      )),

                ],),
                SizedBox(height: 10,),
                Row(children: [
                  Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 5.h,
                        width: 20.w,
                        color: Colors.grey,
                      )),SizedBox(width: 10,),
                  Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 10.h,
                        width: 200.w,
                        color: Colors.grey,
                      )),

                ],),
              ],
            ),
          ),

          SizedBox(height: 10,),
          Row(children: [
            Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 10.h,
                  width: 20.w,
                  color: Colors.grey,
                )),SizedBox(width: 10,),
            Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 10.h,
                  width: 120.w,
                  color: Colors.grey,
                )),

          ],), SizedBox(height: 10,),
          Row(children: [
            Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 10.h,
                  width: 20.w,
                  color: Colors.grey,
                )),SizedBox(width: 10,),
            Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 10.h,
                  width: 120.w,
                  color: Colors.grey,
                )),

          ],), SizedBox(height: 10,),
          Row(children: [
            Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 10.h,
                  width: 20.w,
                  color: Colors.grey,
                )),SizedBox(width: 10,),
            Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 10.h,
                  width: 120.w,
                  color: Colors.grey,
                )),

          ],), SizedBox(height: 10,),
          Row(children: [
            Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 10.h,
                  width: 20.w,
                  color: Colors.grey,
                )),SizedBox(width: 10,),
            Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 10.h,
                  width: 120.w,
                  color: Colors.grey,
                )),

          ],),

        ],)


    );
  }
}
