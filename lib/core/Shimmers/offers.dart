import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OffersShimmers extends StatelessWidget {
  const OffersShimmers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 200.h,
      margin: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),

      ),
      child: Row(
        children: [
          Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 90.h,
                  width: 90.w,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10.h,),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(360),
                  child: Container(
                    height: 50.h,
                    width: 50.w,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 30,),
          Column(
            children: [
              Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Row(
                    children: [
                      Icon(Icons.star,size: 30,), SizedBox(width: 4,),
                      Icon(Icons.star,size: 30,), SizedBox(width: 4,),
                      Icon(Icons.star,size: 30,),

                    ],
                  )
              ),
              SizedBox(height: 10.h,),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 30.h,
                  width: 200.w,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 10.h,),

              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Column(
                  children: [
                    Container(
                      height: 10.h,
                      width: 200.w,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10.h,),
                    Container(
                      height: 10.h,
                      width: 200.w,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
