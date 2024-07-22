import 'package:intl/intl.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/features/Cart/data/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shop/features/Cart/presentation/widgets/payment_methods.dart';
import 'package:ultra_shop/features/payment/presentation/screens/reset_screen.dart';
import '../../../../core/Theme/light_theme.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/shared _pref.dart';
import '../../../Home/presentation/screens/bottom_nav_screen.dart';
import '../../../Order/data/manger/cubit/order_cubit.dart';
import '../../data/models/paypal_models/item_list_model/item.dart';
import '../../data/models/paypal_models/item_list_model/item_list_model.dart';
import '../../data/models/stripe_model/payment_intent_input_model.dart';
import '../../data/repos/checkout_repo_impl.dart';
import '../../data/service/paypal_service.dart';
import '../manger/cubit/payment_cubit.dart';

class Payment extends StatefulWidget {
  Payment({super.key, required this.totalPayment, required this.orders});
  final String totalPayment;
  final List<OrderItemModel> orders;

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 290,
        child: BlocProvider(
            create: (context) => CartCubit(),
            child: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
              int currentselect = CartCubit.get(context).currentindex;
              if (state is PaymentSelectedState) {
                currentselect = state.index;
              }
              return BlocProvider(
                create: (context) => OrderCubit(),
                child: BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: payment.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return PaymentMethods(
                                  onTap: () {
                                    CartCubit.get(context)
                                        .paymentSelected(index);
                                  },
                                  isselected: index == currentselect,
                                  title: titles[index],
                                  image: payment[index],
                                );
                              }),
                        ),
                        BlocProvider(
                          create: (context) => PaymentCubit(CheckoutRepoImpl()),
                          child: BlocConsumer<PaymentCubit, PaymentState>(
                            listener: (context, state) {
                              if (state is PaymentSuccess) {
                                OrderCubit.get(context).checkOutOrder();
                                flutterToast(
                                    message: "checkOutOrder success",
                                    success: true);
                                DateTime now = DateTime.now();
                                String formattedDate = DateFormat('MM/dd/yyyy').format(now);
                                String formattedTime = DateFormat('hh:mm a').format(now);

                                userName=  PreferenceUtils.getString(SharedKeys.userName);
                                print(userName.toString());
                                navigateTo(context, PaymentDoneBody(isStripe: true,date: formattedDate, time: formattedTime, totalPayment: widget.totalPayment, userName: userName));
                              }
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              var cubit = PaymentCubit.get(context);
                              return GestureDetector(
                                onTap: () {
                                  var itemList =
                                      ItemListModel(orders: widget.orders);
                                  if (currentselect == 1) {
                                    PaymentService.paymentService
                                        .paypal_Payment(
                                            context: context,
                                            itemList: itemList,
                                            totalPayment: widget.totalPayment);
                                  } else {
                                    PaymentIntentInputModel
                                        paymentIntentInputModel =
                                        PaymentIntentInputModel(
                                      amount: widget.totalPayment,
                                    );
                                    cubit.makePayment(
                                        paymentIntentInputModel:
                                            paymentIntentInputModel);
                                  }
                                },
                                child: Container(
                                  height: 60,
                                  width: 150,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 10.w),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 10.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      color: AppColors.myGreen,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                191, 214, 215, 1),
                                            offset: Offset(1, 1),
                                            spreadRadius: 0,
                                            blurRadius: 4)
                                      ]),
                                  child: Center(
                                    child: state is PaymentLoading
                                        ? CircularProgressIndicator(
                                            color: AppColors.primaryColor)
                                        : Text("payment",
                                            style: lightTheme
                                                .textTheme.labelSmall!
                                                .apply(
                                              fontSizeFactor: 1.sp,
                                              color: AppColors.myWhite,
                                            )),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  },
                ),
              );
            })));
  }
}
