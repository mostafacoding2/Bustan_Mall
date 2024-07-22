import 'package:ultra_shop/core/utils/api_constant.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Order/data/models/order_model.dart';
import 'package:dio/dio.dart';
import 'package:ultra_shop/core/utils/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'order_state.dart';
class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
 static OrderCubit get(context)=>BlocProvider.of(context);
  void checkOutOrder() async
  {
    try {
      emit(CheckOutOrderLoadingState());
      Response response = await DioHelper.getData(
          url: ApiConstant.checkOut, bearerToken: token);
      emit(CheckOutOrderSuccessState(response.data));
    }
    on DioException catch(e)
    {
      emit(CheckOutOrderErrorState(e.toString()));
    }
  }
  List<OrderModel> orders=[];
  Future  viewOrder()async {
    try{
      emit(ViewOrdersLoadingState());
      final response = await DioHelper.getData(bearerToken: token,
          url: ApiConstant.viewOrders);
      orders=(response.data as List<dynamic>).map((e) => OrderModel.fromJson(e)).toList();
      emit (ViewOrdersSuccessState(orders));
      return orders;
    }
    on DioException catch (e) {
      print(e.toString());
      final String errorMassage =
          e.response?.data;
      debugPrint("errorMassage${errorMassage.toString()}");
      emit(ViewOrdersErrorState((errorMassage)));
    }
  }

  void cancelOrder({required String orderNumber}) async
  {
    try {
      emit(CancelOrderLoadingState());
      FormData formData=FormData.fromMap({"orderNumber":orderNumber});
      Response response = await DioHelper.postData(data: formData,
          url: ApiConstant.cancelOrder, token: token);
      emit(CancelOrderSuccessState());
    }
    on DioException catch(e)
    {
      emit(CancelOrderErrorState(e.toString()));
    }
  }

}
