import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Cart/data/cubit/cart_cubit.dart';
import 'package:ultra_shop/features/Home/presentation/screens/bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ItemDeletedProductFromCart extends StatefulWidget {
  const ItemDeletedProductFromCart({super.key, required this.quantity,required this.id});
  final int quantity;
  final int id;
  @override
  State<ItemDeletedProductFromCart> createState() => _ItemDeletedProductFromCartState();
}

class _ItemDeletedProductFromCartState extends State<ItemDeletedProductFromCart> {
  int quantityDeleted=1;
  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (context) => CartCubit(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if(state is DeleteProductFromCartSuccessState){
            navigateTo(context, BottomNavScreen(currentIndex: 1,));
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(height: 150.h,width: double.infinity,
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Quantity Deleted=' ,    style:lightTheme
                        .textTheme
                        .labelSmall!
                        .apply(
                      fontSizeFactor: 1.sp,
                      color: AppColors.myDark,
                    ),),SizedBox(width: 50.w,),
                    DropdownButton<int>(dropdownColor: Colors.white,
                      value: quantityDeleted,
                      underline: const SizedBox(),
                      onChanged: (int? newValue) {
                        setState(() {
                          quantityDeleted = newValue!;
                        });
                      },
                      items: List.generate(
                        widget.quantity,
                            (index) =>
                            DropdownMenuItem<int>(
                              value: index + 1,
                              child: Text('${index + 1}' ,    style:lightTheme
                                  .textTheme
                                  .labelSmall!
                                  .apply(
                                fontSizeFactor: 1.sp,
                                color: AppColors.myDark,
                              ),),
                            ),
                      ),
                    ),
                  ],
                ),SizedBox(height: 40.h,),
                Row(children:
                [const Spacer(),
                  InkWell(onTap: ()
                  {
                    CartCubit.get(context).deleteProductFromCart(id: widget.id, quantity: quantityDeleted);
                  },
                    child: Container(padding: EdgeInsets.all(10.r),
                      height:40.w,decoration: BoxDecoration(color:AppColors.myRed,borderRadius: BorderRadius.circular(12.r)),
                      child: Center(
                          child: Text("Delete",style: lightTheme.textTheme.labelMedium!.apply(
                            fontSizeFactor: 1.sp,
                            color: AppColors.myWhite,
                          ))
                      ),
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

              ],
            ),
          );
        },
      ),
    );
  }
}
