import 'package:cached_network_image/cached_network_image.dart';
import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class CustomItemProductSearch extends StatelessWidget {
  const CustomItemProductSearch({
    super.key,
    required this.urlImage,
    required this.rating,
    required this.price,
    required this.nameDevice,
    required this.description, this.onTap,
  });
  final void Function()? onTap;

  final String urlImage;
  final int rating;
  final String price;
  final String nameDevice;
  final String description;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: Container(padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.myWhite,
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(191, 214, 215, 1),
                  offset: Offset(1, 1),
                  spreadRadius: 0,
                  blurRadius: 4)
            ]),
        child: Row(
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
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
            SizedBox(width: 10.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      size: 28,
                      color: AppColors.myYellow,
                    ),
                    Text(
                      "$rating",
                      style: lightTheme.textTheme.titleSmall!.apply(
                        fontSizeFactor: 1.sp,
                        color: AppColors.myDark,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      r"$",
                      style: lightTheme.textTheme.titleSmall!.apply(
                        fontSizeFactor: 1.sp,
                        color: AppColors.myYellow2,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      "$price",
                      style: lightTheme.textTheme.titleSmall!.apply(
                        fontSizeFactor: 1.sp,
                        color: AppColors.myGreen,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      maxLines: 1,
                      nameDevice,
                      style: lightTheme.textTheme.labelMedium!.apply(
                        overflow: TextOverflow.ellipsis,
                        fontSizeFactor: 1.sp,
                        color: AppColors.myRed,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      maxLines: 3,
                      description,
                      style: lightTheme.textTheme.displayMedium!.apply(
                        overflow: TextOverflow.ellipsis,
                        fontSizeFactor: 1.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
