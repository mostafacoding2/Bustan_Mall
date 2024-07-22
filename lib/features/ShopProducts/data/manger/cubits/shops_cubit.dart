import 'dart:developer';

import 'package:ultra_shop/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:ultra_shop/core/utils/api_constant.dart';
import 'package:ultra_shop/core/utils/dio_helper.dart';
import 'package:ultra_shop/features/ShopProducts/data/model/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'shops_state.dart';
class ShopsCubit extends Cubit<ShopsState> {
  ShopsCubit() : super(ShopProductsInitial());
  static  ShopsCubit get(context)=>BlocProvider.of(context);
  List<ShopsModel> allShop=[];
  Future  getAllShopProducts()async {
    try{
      emit(GetAllShopProductsLoadingState());
      final response = await DioHelper.getData(
          url: ApiConstant.getAllShopProducts);
      allShop=(response.data as List<dynamic>).map((e) => ShopsModel.fromJson(e)).toList();
      emit (GetAllShopProductsSuccessState(allShop));
      return allShop;
    }
    on DioException catch (e) {
      final String errorMassage =
          e.response?.data;
      debugPrint("errorMassage${errorMassage.toString()}");
      emit(GetAllShopProductsErrorState((errorMassage)));
    } catch (e) {
      log(e.toString());
      debugPrint("errorMassage${e.toString()}");
      emit(GetAllShopProductsFailureState((e.toString())));
    }
  }


  List<ShopsModel> myShops=[];
  Future  getMyShops()async {
    try{
      emit(GetMyShopLoadingState());
      final response = await DioHelper.getData(bearerToken: token,
          url: ApiConstant.getMyShop);
      myShops=(response.data as List<dynamic>).map((e) => ShopsModel.fromJson(e)).toList();
      emit (GetMyShopsSuccessState(myShops));
      return myShops;
    }
    on DioException catch (e) {
      final String errorMassage =
          e.response?.data;
      debugPrint("errorMassage${errorMassage.toString()}");
      emit(GetMyShopsErrorState((errorMassage)));
    }
  }
void createShop({
  required String imagePath,
  required String name,
  required String theDoorNumber,
  required String phoneNumber,
  required String userId,
  required String email,
}){
    try{
    emit(CreateShopsShopsLoadingState());
    var formData = FormData.fromMap({
      "Name":name,
      "TheDoorNumber":theDoorNumber,
      "PhoneNumber":phoneNumber,
      "USerId":userId,
      "Email":email,
    });

    var response=DioHelper.postData(data: formData,
        token: token,
        url: ApiConstant.createShop(imagePath: imagePath));
emit(CreateShopsSuccessState());
}on DioException catch (e){
      final String errorMassage =
          e.response?.data;
      debugPrint("errorMassage${errorMassage.toString()}");
      emit(CreateShopsErrorState((errorMassage)));
    }

  }

  void updateShop({
    required String imagePath,
    required int id,
    required String name,
    required String theDoorNumber,
    required String phoneNumber,
    required String email,
  })async{
    try{
      emit(UpdateShopsLoadingState());
      var formData = FormData.fromMap({
        "Name":name,
        "TheDoorNumber":theDoorNumber,
        "PhoneNumber":phoneNumber,
        "Email":email,
      });

      Response response= await DioHelper.putData(data: formData,
          token: token,
          url: ApiConstant.updateShop(imagePath: imagePath,id:id));
      emit(UpdateShopsSuccessState());
    }on DioException catch (e){
      final String errorMassage =
          e.response?.data;
      debugPrint("errorMassage${errorMassage.toString()}");
      emit(UpdateShopsErrorState((errorMassage)));
    }

  }

  void deleteShop({required int id})async{
    try{
      emit(DeleteShopsLoadingState());
      Response response= await DioHelper.deleteData(
          token: token,
          url: ApiConstant.deleteShop(id:id));
      emit(DeleteShopsSuccessState());
    }on DioException catch (e){
      print(e.response?.data);
      final String errorMassage =
          e.response?.data;
      debugPrint("errorMassage$errorMassage");
      emit(DeleteShopsErrorState((errorMassage)));
    }
  }
}
