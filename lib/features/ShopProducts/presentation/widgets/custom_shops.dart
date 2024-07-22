import 'package:cached_network_image/cached_network_image.dart';
import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomShops extends StatelessWidget {
  const CustomShops(
      {super.key,
      required this.name,
      required this.theDoorNumber,
      required this.urlImage,
      this.onTap});
  final String name;
  final String theDoorNumber;
  final String urlImage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.fill,
                    imageUrl: urlImage,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error, color: AppColors.myRed),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  name,
                  style: lightTheme.textTheme.labelMedium!.apply(
                    fontSizeFactor: 1.sp,
                    color: AppColors.myRed2,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  theDoorNumber,
                  maxLines: 1,
                  style: lightTheme.textTheme.displayMedium!.apply(
                    overflow: TextOverflow.ellipsis,
                    fontSizeFactor: 1.sp,
                    color: AppColors.myDark,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
