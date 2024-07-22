import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
class CustomCategory extends StatelessWidget {
  const CustomCategory({super.key,this.onTap, required this.name, required this.urlImage});
  final String name;
  final String urlImage;
 final void Function()?onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap:onTap,
      child: Column(
        children: [
          Container( height: 170.h,            width: 120.w,
            padding: EdgeInsets.only(top: 10.h,bottom: 10.h,left: 10.w,right: 10.w),
            margin: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),color:AppColors.myWhite,
                boxShadow:[BoxShadow(color: Color.fromRGBO(191, 214, 215, 0.6),offset:Offset(1, 1),spreadRadius: 0,blurRadius: 4)] )
            , child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
             Container(height: 90.h,width:90.w,decoration: BoxDecoration(color:AppColors.myOffWhite ,border: Border.all(color: AppColors.primaryColor),borderRadius: BorderRadius.circular(360)),
                    child:Center(

                      child:   urlImage.split(".").last=="svg"? SvgPicture.network(urlImage,height: 50.h,fit: BoxFit.fill,):
                      ClipRRect(borderRadius: BorderRadius.circular(360),
                        child: CachedNetworkImage(
                          height: 90.h,width:90.w,fit: BoxFit.fill,
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
                      ),


                    ),
                  )
                ,SizedBox(height: 5.h,),
                Center(
                  child: Text(
                    name,
                    style: lightTheme.textTheme.labelMedium!.apply(
                      fontSizeFactor: 1.sp,
                      color: AppColors.myBlueGrey2,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
