import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Order/data/manger/cubit/order_cubit.dart';
import 'package:ultra_shop/features/Order/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shop/features/Order/presentation/widgets/custom_product_order.dart';

import 'custom_cancel.dart';

class CustomOrder extends StatelessWidget {
  const CustomOrder({
    super.key,
    required this.productsOrder,
    required this.orderPrice,
    required this.productStatus,
    required this.oerderDate,
    required this.orderTime,
    required this.orderNumber,
  });

  final List<ProductsOrder> productsOrder;
  final double orderPrice;
  final String productStatus;
  final String orderNumber;
  final String oerderDate;
  final String orderTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
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
          Expanded(
              child: productsOrder.length == 0
                  ? SizedBox(
                      height: 0,
                    )
                  : SizedBox(
                      height: 180.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productsOrder.length,
                          itemBuilder: (context, index) {
                            return CustomProductOrder(
                              productsOrder: productsOrder[index],
                            );
                          }),
                    )),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 1,
              ),
              Text(
                "OrderPrice: ",
                style: lightTheme.textTheme.displayMedium!.apply(
                  overflow: TextOverflow.ellipsis,
                  fontSizeFactor: 1.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                "$orderPrice",
                style: lightTheme.textTheme.displayMedium!.apply(
                  overflow: TextOverflow.ellipsis,
                  fontSizeFactor: 1.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Date: ",
                style: lightTheme.textTheme.displayMedium!.apply(
                  overflow: TextOverflow.ellipsis,
                  fontSizeFactor: 1.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                oerderDate,
                style: lightTheme.textTheme.displayMedium!.apply(
                  overflow: TextOverflow.ellipsis,
                  fontSizeFactor: 1.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                "Time: ",
                style: lightTheme.textTheme.displayMedium!.apply(
                  overflow: TextOverflow.ellipsis,
                  fontSizeFactor: 1.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                orderTime,
                style: lightTheme.textTheme.displayMedium!.apply(
                  overflow: TextOverflow.ellipsis,
                  fontSizeFactor: 1.sp,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 9,
              ),
              Text(
                "OrderStatus: ",
                style: lightTheme.textTheme.displayMedium!.apply(
                  overflow: TextOverflow.ellipsis,
                  fontSizeFactor: 1.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                productStatus,
                style: lightTheme.textTheme.displayMedium!.apply(
                  overflow: TextOverflow.ellipsis,
                  fontSizeFactor: 1.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              Spacer(
                flex: 5,
              ),
              BlocConsumer<OrderCubit, OrderState>(
                listener: (context, state) {
                  if (state is CancelOrderSuccessState) {
                    flutterToast(message: "Cancel done", success: false);
                    OrderCubit.get(context).viewOrder();

                  }
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return CustomCancel(
                    onTap: () {
                      OrderCubit.get(context)
                          .cancelOrder(orderNumber: orderNumber);
                    },
                    widget: Center(
                      child: state is CancelOrderLoadingState
                          ?CircularProgressIndicator(
                        color: AppColors.primaryColor): Text(
                              "Cancel ",
                              style:
                                  lightTheme.textTheme.displayMedium!.apply(
                                overflow: TextOverflow.ellipsis,
                                fontSizeFactor: 1.sp,
                                color: AppColors.myWhite,
                              ),
                            )

                    ),
                  );
                },
              ),
              Spacer(
                flex: 1,
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
