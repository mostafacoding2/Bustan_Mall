import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomDiscount extends StatelessWidget {
 const CustomDiscount({super.key, required this.imageUrls, required this.averageRate, required this.itemName, required this.description, this.onTap,});
 final  String imageUrls ;
 final  String description ;
 final  String itemName ;
 final  int averageRate ;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: Container(    width: 375.w,
        decoration: BoxDecoration(
            color: AppColors.myWhite,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16)
                ,bottomRight: Radius.circular(16)),boxShadow: [BoxShadow(color: Colors.white12,offset:Offset(1, 4),spreadRadius: 0,blurRadius: 1)]
        ),
        child: Column(
          children: [
            SizedBox(height: 5.h,),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10.w,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      height: 100.h,
                      width: 100.w,fit: BoxFit.fill,
                      imageUrl: imageUrls,
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
                    Padding(
                      padding:  EdgeInsets.only(left: 18.0,top: 10.h),
                      child: CircleAvatar(radius:30,backgroundColor: AppColors.myRed,child: Text('20%\n OFF',
                        style:  lightTheme.textTheme.displaySmall!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.myWhite,
                        ),),),
                    ),
                  ],
                ),
                SizedBox(width: 10.w,),
                Expanded(flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(  height:50.h,child: ListView.builder(padding:EdgeInsets.only(left: 70.w),
                          scrollDirection: Axis.horizontal,
                          itemCount:averageRate==0?2:averageRate ,
                          itemBuilder: (context,index){
                        return Icon(Icons.star,color: AppColors.myOrange,size: 34,);
                      }))

                     ,SizedBox(height: 12.h,),
                      Align(alignment: Alignment.center,
                        child: Text(maxLines: 2,
                          itemName,
                          style: lightTheme.textTheme.labelMedium!.apply(overflow: TextOverflow.ellipsis,
                            fontSizeFactor: 1.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),SizedBox(height: 12.h,),

                      Align(alignment: Alignment.center,
                        child: Text(maxLines: 2,
                          description,
                          style: lightTheme.textTheme.displayMedium!.apply(overflow:TextOverflow.ellipsis,
                            fontSizeFactor: 1.sp,
                            color: AppColors.myOrange,
                          ),
                        ),
                      ),                   SizedBox(height: 12.h,),


                    ],
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}