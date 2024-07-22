import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ultra_shop/core/utils/api_constant.dart';
import 'dart:developer';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:ultra_shop/features/Order/data/manger/cubit/order_cubit.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/shared _pref.dart';
import '../../../Home/presentation/screens/bottom_nav_screen.dart';
import '../../presentation/screens/reset_screen.dart';
import '../models/paypal_models/item_list_model/item_list_model.dart';

class PaymentService {
  static PaymentService paymentService = PaymentService();





  void paypal_Payment({required BuildContext context,
    required ItemListModel itemList,
    required String totalPayment}) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM/dd/yyyy').format(now);
    String formattedTime = DateFormat('hh:mm a').format(now);

    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) =>
          BlocProvider(
            create: (context) => OrderCubit(),
            child: BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) {

                return PaypalCheckoutView(
                  sandboxMode: true,
                  clientId: ApiConstant.clientID,
                  secretKey: ApiConstant.paypalSecret,
                  transactions: [
                    {
                      "amount": {
                        "total": totalPayment,
                        "currency": "USD",
                        "details": {
                          "subtotal": totalPayment,
                          "shipping": '0',
                          "shipping_discount": 0
                        }
                      },
                      "description": "The payment transaction description.",
                      // "payment_options": {
                      //   "allowed_payment_method":
                      //       "INSTANT_FUNDING_SOURCE"
                      // },
                      "item_list": itemList.toJson()
                    }
                  ],
                  note: "Contact us for any questions on your order.",
                  onSuccess: (Map params) async {
                    OrderCubit.get(context).checkOutOrder();
                    flutterToast(
                        message:
                        "checkOutOrder success",
                        success: true);
                    log("onSuccess: $params");
                    userName=  PreferenceUtils.getString(SharedKeys.userName);
                    print(userName.toString());
                   navigateTo(context, PaymentDoneBody(
                       isStripe: false,
                       date: formattedDate, time: formattedTime, totalPayment: totalPayment, userName: userName));
                  },
                  onError: (error) {
                    log("onError: $error");
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    print('cancelled:');
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
    ));
  }
}
