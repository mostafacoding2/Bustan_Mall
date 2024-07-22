import 'package:cached_network_image/cached_network_image.dart';
import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/features/Cart/presentation/widgets/custom_remove_product_from_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class CustomCartProduct extends StatefulWidget {
   CustomCartProduct({super.key, required this.quantity, required this.Price, required this.discription, required this.nameProduct,required this.urlImage,required this.id});
  final int quantity;
  final int id;
  final double Price;
  final String discription;
  final String nameProduct;
  final String urlImage;
  @override
  State<CustomCartProduct> createState() => _CustomCartProductState();
}

class _CustomCartProductState extends State<CustomCartProduct> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 174.w,
      margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
      padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),color: AppColors.myWhite,
          boxShadow:[BoxShadow(color: Color.fromRGBO(191, 214, 215, 1),offset:Offset(1, 1),spreadRadius: 0,blurRadius: 4)] ),
      child: Column(children: [
        Row(
          children: [
            CachedNetworkImage(
            height: 90.h,width: 90.w,fit: BoxFit.fill,
              imageUrl: widget.urlImage,
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

            SizedBox(width: 40.w,),
            Expanded(
              child: Column(
                children: [
                  Text(widget.nameProduct,style: lightTheme.textTheme.labelSmall!.apply(
                    fontSizeFactor: 1.sp,
                    color: AppColors.myNavy,
                  ),),
                  SizedBox(height: 10,),
                  Text(r"$""${widget.Price}",style: lightTheme.textTheme.labelMedium!.apply(
                    fontSizeFactor: 1.sp,
                    color: AppColors.myOrange,
                  ),),
                ],
              ),
            ),

          ],
        ),
        Text(maxLines: 10,widget.discription,style: lightTheme.textTheme.labelMedium!.apply(overflow: TextOverflow.ellipsis,
          fontSizeFactor: 1.sp,
          color: AppColors.myDark,
        ),),

        Row(
          children: [
            Text("quantity :",style: lightTheme.textTheme.titleSmall!.apply(
            fontSizeFactor: 1.sp,
            color: AppColors.myDark,
          ),),
              Text("${widget.quantity}",style: lightTheme.textTheme.titleSmall!.apply(
                fontSizeFactor: 1.sp,
                color: AppColors.myDarkRed,
              ),),SizedBox(width: 180.w,),
            
                 IconButton(
                    onPressed: () {
                      showModalBottomSheet(context: context, builder: (context){
                        return ItemDeletedProductFromCart(id:widget.id,quantity: widget.quantity);
                      });
                     
                    },
                    icon: Icon(Icons.delete,
                        size: 30,
                        color: AppColors.primaryColor)),
              
            SizedBox(width: 10.w,),
           
                   ],
        ),
      ],),
    );
  }
}
