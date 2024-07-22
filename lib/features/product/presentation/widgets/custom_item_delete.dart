import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/ShopProducts/presentation/screens/shops_screens.dart';
import 'package:ultra_shop/features/product/data/manger/cubits/product_cubit.dart';
import 'package:ultra_shop/features/product/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Home/presentation/screens/bottom_nav_screen.dart';
class ItemDelete extends StatefulWidget {
  const   ItemDelete({super.key,required  this.title, required this.id,this.comming});
  final  String title;
  final  String ?comming;
  final int id;
  @override
  State<ItemDelete> createState() => _ItemDeleteState();
}
class _ItemDeleteState extends State<ItemDelete> {
  @override
  Widget build(BuildContext context,) {
    return
      AlertDialog(
          backgroundColor: AppColors.myWhite,
          content:Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            height: 200.h,
            width: 327.w,
            child: Column(
              children: [
                Text("Warning",style: lightTheme.textTheme.labelMedium!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.primaryColor,
                ),),
                SizedBox(height: 53.h,),
                Text(widget.title,
                  style: lightTheme.textTheme.displaySmall!.apply(
                    fontSizeFactor: 1.sp,
                    color: AppColors.myDark,
                  ),),
                Spacer(),
                Row(children:
                [const Spacer(),
                  BlocProvider(
  create: (context) => ProductCubit(),
  child: BlocConsumer<ProductCubit, ProductState>(
  listener: (context, state) {
    if(state is DeleteProductIdSuccessState){
      flutterToast(message: "Deleted", success: true);
      if(widget.comming=="shop"){
        setState(() {
          navigateTo(context,ShopsScreen() );
        });

      }
     else if(widget.comming=="products"){
       setState(() {
         navigateTo(context,ProductsScreen() );
       });
      }
    else{
        navigateTo(context, BottomNavScreen(currentIndex: 0,));
      }

    }

    if(state is DeleteProductIdErrorState){
      flutterToast(message: "Failed", success: false);
    }

    // TODO: implement listener
  },
  builder: (context, state) {
    return InkWell(onTap: ()
                  {
                    ProductCubit.get(context).deleteProductId(id: widget.id);
navigateTo(context, ShopsScreen());
                  },
                    child: Container(padding: EdgeInsets.all(10.r),
                      height:40.w,decoration: BoxDecoration(color:AppColors.myRed,borderRadius: BorderRadius.circular(12.r)),
                      child: Center(
                        child: Text("Sure",style: lightTheme.textTheme.labelMedium!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.myWhite,
                        )),
                      ),
                    ),
                  );
  },
),
),
                  Spacer(flex: 4,),
                  InkWell(onTap: ()
                  {
                    Navigator.of(context).pop(false);                             },
                    child: Container
                      (padding: EdgeInsets.all(10.r),
                      height: 40.h,decoration: BoxDecoration(color:AppColors.myBlueGrey,borderRadius: BorderRadius.circular(12.r)),
                      child: Center(

                          child: Text("Cancel",style: lightTheme.textTheme.labelMedium!.apply(
                            fontSizeFactor: 1.sp,
                            color: AppColors.myWhite,
                          ))),
                    ),
                  ),
                  SizedBox(width: 24.h,),

                ],),
                SizedBox(height: 22.h,),
              ],),
          )
      ) ;}
}
