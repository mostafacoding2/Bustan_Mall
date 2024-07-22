import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ultra_shop/core/utils/api_constant.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/core/utils/dio_helper.dart';
import 'package:ultra_shop/features/product/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/workspace_model.dart';
part 'product_state.dart';
class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of(context);

  // ToDo updateProductId
  List<XFile>? imagepicker = [];

  uploadimage(List<XFile> images) {
    imagepicker = images;
    emit(UpLoadImageUpdateProductState());
  }

  // ToDo getProductId
  ProductModel? getProductModel;

  Future getProductId({
    required int id,
  }) async {
    try {
      emit(GetProductIdLoadingState());
      final response = await DioHelper.getData(query: ({"id": id}),
        url: ApiConstant.getProductId,
      );
      getProductModel = ProductModel.fromJson(response.data);
      print(getProductModel);
      emit(GetProductIdSuccessState(getProductModel!));
      return getProductModel;
    } on DioException catch (e) {
      final String errorMassage =
          e.response?.data['title'] ?? 'oops there was an error try later';
      debugPrint("errorMassage1${errorMassage.toString()}");
      emit(GetProductIdErrorState((errorMassage)));
    } catch (e) {
      log(e.toString());
      debugPrint("errorMassage${e.toString()}");
      emit(GetProductIdFailureState((e.toString())));
    }
  }

  List<ProductModel> searchProduct = [];

  Future getProductByName({required String name}) async {
    try {
      emit(GetProductNameLoadingState());
      final response = await DioHelper.getData(
        url: ApiConstant.getProductByName(name: name),
      );
      searchProduct = (response.data as List<dynamic>)
          .map((e) => ProductModel.fromJson(e))
          .toList();
      emit(GetProductNameSuccessState(searchProduct));
      return searchProduct;
    } on DioException catch (e) {
      final String errorMassage =
          e.response?.data ?? 'oops there was an error try later';
      debugPrint("errorMassage1${errorMassage.toString()}");
      emit(GetProductNameErrorState((errorMassage)));
    } catch (e) {
      log(e.toString());
      debugPrint("errorMassage${e.toString()}");
      emit(GetProductNameFailureState((e.toString())));
    }
  }

  List<ProductModel> allProducts = [];

  Future getAllProduct() async {
    try {
      emit(GetAllProductLoadingState());
      final response = await DioHelper.getData(
          url: ApiConstant.getAllProduct);
      allProducts = (response.data as List<dynamic>)
          .map((e) => ProductModel.fromJson(e))
          .toList();
      emit(GetAllProductSuccessState(allProducts));
      return allProducts;
    }
    on DioException catch (e) {
      final String errorMassage =
          e.response?.data;
      debugPrint("errorMassage${errorMassage.toString()}");
      emit(GetAllProductErrorState((errorMassage)));
    } catch (e) {
      log(e.toString());
      debugPrint("errorMassage${e.toString()}");
      emit(GetAllProductFailureState((e.toString())));
    }
  }

  List<ProductModel> myProducts = [];

  Future getMyProduct() async {
    try {
      emit(GetMyProductLoadingState());
      final response = await DioHelper.getData(bearerToken: token,
          url: ApiConstant.getMyProduct
      );
      myProducts = (response.data as List<dynamic>)
          .map((e) => ProductModel.fromJson(e))
          .toList();
      emit(GetMyProductSuccessState(myProducts));
      return myProducts;
    }
    on DioException catch (e) {
      final String errorMassage =
          e.response?.data;
      debugPrint("errorMassage${errorMassage.toString()}");
      emit(GetMyProductErrorState((errorMassage)));
    } catch (e) {
      log(e.toString());
      debugPrint("errorMassage${e.toString()}");
      emit(GetMyProductFailureState((e.toString())));
    }
  }


  void postProduct({
    required String categoryName,
    required String itemName,
    required int priceProd,
    required String descrip,
    required int stockProd,
    required int solditemsProd,
    required int quantityProd,
    required String nameShop
  }) async {
    try {
      Map<String, dynamic> data = {
        'categoryName': categoryName,
        'item_Name': itemName,
        'priceProd': priceProd,
        'descrip': descrip,
        'stockProd': stockProd,
        'solditemsProd': solditemsProd,
        'quantityProd': quantityProd,
        'nameShop': nameShop,
      };
      emit(PostProductLoadingState());

      FormData formData = FormData();
      data.forEach((key, value) {
        formData.fields.add(MapEntry(key, value.toString()));
      });
      for (int i = 0; i < imagepicker!.length; i++) {
        XFile image = imagepicker![i];
        String fileName = image.path
            .split('/')
            .last;
        formData.files.add(MapEntry(
          'ImageFiles',
          await MultipartFile.fromFile(image.path, filename: fileName),
        ));
      }
      final response = await DioHelper.postData(token: token,
          url: ApiConstant.postProduct, data: formData);
      emit(PostProductSuccessState());
    } on DioException catch (e) {
      print(e.toString());
      final dynamic errorMassage =
          e.response?.data ?? 'oops there was an error try later';
      debugPrint("errorMassage${errorMassage.toString()}");
      emit(PostProductErrorState((errorMassage)));
    }
  }


  void updateProductId({
    required int id,
    required String categoryName,
    required String itemName,
    required int priceProd,
    required String descrip,
    required int stockProd,
    required int solditemsProd,
    required int quantityProd,
    required String nameShop
  }) async {
    try {
      Map<String, dynamic> data = {
        'categoryName': categoryName,
        'item_Name': itemName,
        'priceProd': priceProd,
        'descrip': descrip,
        'stockProd': stockProd,
        'solditemsProd': solditemsProd,
        'quantityProd': quantityProd,
        'nameShop': nameShop,
      };
      emit(UpdateProductIdLoadingState());

      FormData formData = FormData();
      data.forEach((key, value) {
        formData.fields.add(MapEntry(key, value.toString()));
      });
      for (int i = 0; i < imagepicker!.length; i++) {
        XFile image = imagepicker![i];
        String fileName = image.path
            .split('/')
            .last;
        formData.files.add(MapEntry(
          'ImageFiles',
          await MultipartFile.fromFile(image.path, filename: fileName),
        ));
      }


      final response = await DioHelper.putData(token: token,
          url: ApiConstant.upDateProductId(id: id), data: formData);
      emit(UpdateProductIdSuccessState());
    } on DioException catch (e) {
      print(e.toString());
      final dynamic errorMassage =
          e.response?.data ?? 'oops there was an error try later';
      debugPrint("errorMassage${errorMassage.toString()}");
      emit(UpdateProductIdErrorState((errorMassage)));
    }
  }


  void deleteProductId({
    required int id,
  }) async {
    try {
      emit(DeleteProductIdLoadingState());
      final response =
      await DioHelper.deleteData(
          token: token, url: ApiConstant.deleteProductId(id: id));
      emit(DeleteProductIdSuccessState());
      return response.data;
    } on DioException catch (e) {
      final String errorMassage =
          e.response?.data ?? 'oops there was an error try later';
      debugPrint("errorMassage1${errorMassage.toString()}");
      emit(DeleteProductIdErrorState((errorMassage)));
    } catch (e) {
      log(e.toString());
      debugPrint("errorMassage${e.toString()}");
      emit(DeleteProductIdFailureState((e.toString())));
    }
    return null;
  }


  List<ProductbySortReviewModel> WorkspacesbySortReview = [];

  Future getAllWorkspacesbySortReview() async {
    try {
      emit(GetAllWorkspacesbySortReviewLoadingState());
      final response = await DioHelper.getData(bearerToken: token,
          url: ApiConstant.GetAllProductbySortReview
      );
      WorkspacesbySortReview = (response.data as List<dynamic>).map((e) =>
          ProductbySortReviewModel.fromJson(e)).toList();
      emit(GetAllWorkspacesbySortReviewSuccessState(WorkspacesbySortReview));

      print(WorkspacesbySortReview);
      return WorkspacesbySortReview;
    }
    on DioException catch (e) {
      final String errorMassage =
          e.response?.data;
      debugPrint("errorMassage${errorMassage.toString()}");
      emit(GetAllWorkspacesbySortReviewErrorState((errorMassage)));
    } catch (e) {
      log(e.toString());
      debugPrint("errorMassage${e.toString()}");
      emit(GetAllWorkspacesbySortReviewFailureState((e.toString())));
    }
  }
}