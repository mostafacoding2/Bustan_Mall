import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_color.dart';

class CartShimmer extends StatelessWidget {
  const CartShimmer({super.key});

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
              children: [
                Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 100.h,
                      width: 100.w,
                      color: Colors.grey,
                    )),
                SizedBox(
                  width: 120.w,
                ),
                Column(
                  children: [
                    Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 10.h,
                          width: 20.w,
                          color: Colors.grey,
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 10.h,
                          width: 20.w,
                          color: Colors.grey,
                        )),
                    SizedBox(
                      width: 120.h,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 10.h,
                  width: 220.w,
                  color: Colors.grey,
                )),
            SizedBox(
              height: 10.w,
            ),
            Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 10.h,
                  width: 220.w,
                  color: Colors.grey,
                )),
            SizedBox(
              height: 10.w,
            ),
            Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 10.h,
                  width: 220.w,
                  color: Colors.grey,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 240.0),
              child: Icon(Icons.delete, size: 30, color: Colors.grey),
            ),
          ],
        ));
  }
}
