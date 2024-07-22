import 'package:cached_network_image/cached_network_image.dart';
import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class CustomProduct extends StatelessWidget {
  const CustomProduct({super.key,this.onTap, required this.description,required this.urlImage, required this.nameDevice, required this.rating, required this.price});
  final String nameDevice;
  final String price;
  final String description;
  final int rating;
  final String urlImage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap:onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),color: AppColors.myWhite,
            boxShadow:[BoxShadow(color: Color.fromRGBO(191, 214, 215, 1),offset:Offset(1, 1),spreadRadius: 0,blurRadius: 4)] ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 5.h,),
            Row(
              children: [
                CachedNetworkImage(
                  width: 100.w,height: 100.h,fit: BoxFit.fill,
                  imageUrl: urlImage,
                  placeholder: (context, url) =>
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                  errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      color: AppColors.myRed),
                ),
                SizedBox(width: 10.w,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start,children: [ Icon(Icons.star,size:28,color: AppColors.myYellow,),
                    Text("$rating",style: lightTheme.textTheme.titleSmall!.apply(
                      fontSizeFactor: 1.sp,
                      color: AppColors.myDark,
                    ),),],),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        r"$",
                        style: lightTheme.textTheme.titleSmall!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.myYellow2,
                        ),
                      ),SizedBox(width: 3.w,),
                      Text(
                        "$price",
                        style: lightTheme.textTheme.titleSmall!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.myGreen,
                        ),
                      ),
                    ],
                  )
                ],)
              ],
            ),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [SizedBox(height: 10.h,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(maxLines: 1,
                      nameDevice,
                      style: lightTheme.textTheme.labelMedium!.apply(overflow: TextOverflow.ellipsis,
                        fontSizeFactor: 1.sp,
                        color: AppColors.myRed,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(maxLines: 2,
                      description,
                      style: lightTheme.textTheme.displayMedium!.apply(overflow: TextOverflow.ellipsis,
                        fontSizeFactor: 1.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
