import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/features/Order/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductOrder extends StatelessWidget {
  const CustomProductOrder({super.key, required this.productsOrder});
  final ProductsOrder productsOrder;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: EdgeInsets.all(15),
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
      child: Column(
        children: [
          CachedNetworkImage(
            height: 60.h,
            width: 60.w,
            fit: BoxFit.fill,
            imageUrl: productsOrder.images![0],
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
          Row(
            children: [
              Text(
                "Name",
                style: lightTheme.textTheme.displayMedium!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.myNavy,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(maxLines: 1,
                  productsOrder.name!,
                  style: lightTheme.textTheme.displayMedium!.apply(
                    overflow: TextOverflow.ellipsis,
                    fontSizeFactor: 1.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                maxLines: 2,
                "description",
                style: lightTheme.textTheme.displayMedium!.apply(
                  overflow: TextOverflow.ellipsis,
                  fontSizeFactor: 1.sp,
                  color: AppColors.myNavy,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  maxLines: 3,
                  productsOrder.description!,
                  style: lightTheme.textTheme.displayMedium!.apply(
                    overflow: TextOverflow.ellipsis,
                    fontSizeFactor: 1.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "price",
                style: lightTheme.textTheme.displayMedium!.apply(
                  overflow: TextOverflow.ellipsis,
                  fontSizeFactor: 1.sp,
                  color: AppColors.myNavy,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${productsOrder.price}",
                style: lightTheme.textTheme.displayMedium!.apply(
                  overflow: TextOverflow.ellipsis,
                  fontSizeFactor: 1.sp,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
