import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
margin: EdgeInsets.all(20),
    child: Column(children: [
      SizedBox(height: 20.h,),
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
      SizedBox(height: 20.h,),
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
      SizedBox(height: 20.h,),
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
      SizedBox(height: 20.h,),
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
      SizedBox(height: 20.h,),
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
    ],),

    );
  }
}
