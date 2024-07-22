import 'package:ultra_shop/core/utils/api_constant.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/core/utils/dio_helper.dart';
import 'package:ultra_shop/features/Cart/data/model/view_cart_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'cart_state.dart';
class CartCubit extends Cubit<CartState> {
  static CartCubit get(context) => BlocProvider.of(context);
  CartCubit() : super(CartInitialState());
  int currentindex=0;
   void paymentSelected(int index){
    currentindex=index;
    emit(PaymentSelectedState(currentindex));
  }
  void addProductToCart({required int id,required int quantity}) async{
    try {
      emit(AddProductToCartLoadingState());
      var formData=FormData.fromMap({
        "quantity":quantity
      });
       var response = await DioHelper.postData(data: formData,
          token: token, url: ApiConstant.addProductToCart(id: id));
      emit(AddProductToCartSuccessState());
    }
    on DioException catch (e) {
      print(e.toString());
      emit(AddProductToCartErrorState(e.toString()));
    }
  }
List<ViewCartModel>viewcartproducts=[];
  Future viewCart() async{
    try {
      emit(ViewCartLoadingState());
      var response = await DioHelper.getData(bearerToken:token, url: ApiConstant.viewCart);
      viewcartproducts=(response.data as List<dynamic>).map((e) => ViewCartModel.fromJson(e)).toList();
      emit (ViewCartSuccessState(viewcartproducts));
      return viewcartproducts;
    }
    on DioException catch (e) {
      print(e.toString());
      emit(ViewCartErrorState(e.toString()));
    }
  }

  void deleteProductFromCart({required int id,required int quantity})async{
    try {
      emit(DeleteProductFromCartLoadingState());
      FormData fromData=FormData.fromMap(({
        "quantity":quantity
      }));
      var response = await DioHelper.postData(data:fromData,
          token:token, url: ApiConstant.removeProductFromCart(id: id));
      emit (DeleteProductFromCartSuccessState());
    }
    on DioException catch (e) {
      print(e.toString());
      emit(DeleteProductFromCartErrorState(e.toString()));
    }
  }
  void  getTotalPayment()async{
    try {
      emit(GetTotalPaymentLoadingState());
      var response = await DioHelper.getData(
          bearerToken:token, url: ApiConstant.totalPayment);
      emit (GetTotalPaymentSuccessState(response.data));
    }
    on DioException catch (e) {
      print(e.toString());
      emit(GetTotalPaymentErrorState(e.toString()));
    }
  }


}
