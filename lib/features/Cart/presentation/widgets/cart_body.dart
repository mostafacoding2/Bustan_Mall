import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/features/Cart/data/cubit/cart_cubit.dart';
import 'package:ultra_shop/features/Cart/presentation/widgets/custom_cart_product.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/Shimmers/cart.dart';
import '../../../../core/Theme/light_theme.dart';
import '../../../payment/data/models/paypal_models/item_list_model/item.dart';
import '../../../payment/presentation/screens/payment_screens.dart';
import '../../data/model/view_cart_model.dart';
class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..viewCart(),
      child: Column(
        children: [
          CustomAppBarTitleArrow(
            title: "Cart ",
          ),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              var Data=CartCubit.get(context).viewcartproducts;

              return Expanded(
                child: Column(children: [
                  Expanded(
                      flex: 7,
                      child:state is! ViewCartLoadingState
                          ? (Data.isNotEmpty)
                          ? SizedBox(
                          height: 575.h,
                          child: ListView.builder(
                              itemCount: Data.length,
                              itemBuilder: (context, index) {
                                var cubit = Data[index];
                                return CustomCartProduct(
                                  id: cubit.id!,
                                  urlImage: cubit.imageUrls![0],
                                  quantity: cubit.quantity!,
                                  Price: cubit.productPrice!,
                                  discription: cubit.productDiscription!,
                                  nameProduct: cubit.productName!,
                                );
                              }))
                          : Center(
                            child: Column(
                                                        children: [SizedBox(height: 250.h,),
                                                          Icon(FontAwesomeIcons.cartPlus,size: 150,color: AppColors.myGrey5,),
                                                          Text("Add The Products to Cart ",style: lightTheme
                                                              .textTheme.labelLarge!
                                                              .apply(
                                                            fontSizeFactor: 1.sp,
                                                            color: AppColors.myDarkRed,
                                                          ),)
                                                        ],
                            ),
                          )
                          : Column(
                        children: [

                          Center(
                            child: CartShimmer(),
                          ),SizedBox(height: 20.h,),
                          Center(
                            child: CartShimmer(),
                          ),

                        ],
                      )
                  ),
                  Expanded(flex: 1,
                    child: BlocConsumer<CartCubit, CartState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        var listCarts = CartCubit.get(context).viewcartproducts;
                        return listCarts.isEmpty
                            ? SizedBox()
                            : BlocProvider(
                            create: (context) => CartCubit()..getTotalPayment(),
                            child: BlocConsumer<CartCubit, CartState>(
                                listener: (context, state) {
                                  // TODO: implement listener
                                }, builder: (context, state) {
                              return Row(
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 230.w,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 10.w),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 10.w),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12.r),
                                        color: AppColors.myWhite,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  191, 214, 215, 1),
                                              offset: Offset(1, 1),
                                              spreadRadius: 0,
                                              blurRadius: 4)
                                        ]),
                                    child: Center(
                                        child: state
                                        is GetTotalPaymentSuccessState
                                            ? Text(state.price,
                                            style: lightTheme
                                                .textTheme.titleSmall!
                                                .apply(
                                              fontSizeFactor: 1.sp,
                                              color: AppColors.myDarkRed,
                                            ))
                                            : Center(
                                            child: CircularProgressIndicator(
                                              color: AppColors.primaryColor,
                                            ))),
                                  ),
                                  state is GetTotalPaymentSuccessState
                                      ? GestureDetector(
                                    onTap: () {

                                      showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.only(
                                                  topLeft:
                                                  Radius.circular(
                                                      16.r),
                                                  topRight:
                                                  Radius.circular(
                                                      16.r))),
                                          builder: (context) {

                                            List<OrderItemModel>orders=[];
                                            for(ViewCartModel order in Data){
                                              String name = order.productName!;
                                              int quantity = order.quantity!;
                                              String price = "${order.productPrice}";
                                              OrderItemModel orderItemModel= OrderItemModel(name: name, quantity:quantity, price:price);
                                              orders.add(orderItemModel);
                                            }
                                            return Payment(
                                              totalPayment: state.price.split("is ").last.trim(),orders: orders,
                                            );
                                          });
                                    },
                                    child: Container(
                                      height: 50.h,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10.h, horizontal: 10.w),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10.h, horizontal: 10.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12.r),
                                          color: AppColors.myGreen,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    191, 214, 215, 1),
                                                offset: Offset(1, 1),
                                                spreadRadius: 0,
                                                blurRadius: 4)
                                          ]),
                                      child: Text("CheckOut",
                                          style: lightTheme
                                              .textTheme.titleSmall!
                                              .apply(
                                            fontSizeFactor: 1.sp,
                                            color: AppColors.myWhite,
                                          )),
                                    ),
                                  )
                                      : SizedBox()
                                ],
                              );
                            }));
                      },
                    ),
                  )
                ],),
              );
            },
          )

        ],
      ),
    );
  }
}