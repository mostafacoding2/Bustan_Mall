import 'dart:developer';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:ultra_shop/core/utils/api_constant.dart';
import 'package:ultra_shop/core/utils/dio_helper.dart';
import 'package:ultra_shop/features/category/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'category_state.dart';
class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
static  CategoryCubit get(context)=>BlocProvider.of(context);

  XFile? imagepicker;
  pickImage(XFile image) {
    imagepicker = image;
    emit(uploadimagestate());
  }


CategoryModel?categoryModel;
   List<CategoryModel> allCategory=[];
  Future  getAllCategories()async {
    try{
      emit(GetAllCategoryLoadingState());
      final response = await DioHelper.getData(
          url: ApiConstant.getAllCategory);
      allCategory=(response.data as List<dynamic>).map((e) => CategoryModel.fromJson(e)).toList();
      print(allCategory);
      emit (GetAllCategorySuccessState(allCategory));
      return allCategory;

    }
    on DioException catch (e) {
      final String errorMassage =
          e.response?.data;
      debugPrint("errorMassage${errorMassage.toString()}");
      emit(GetAllCategoryErrorState((errorMassage)));
    } catch (e) {
      log(e.toString());
      debugPrint("errorMassage${e.toString()}");
      emit(GetAllCategoryFailureState((e.toString())));
    }
  }
  void createCagetory ({
    required bool isDeleted,required String name,
    required String description,
    required int totalProducts,
  })async{
try {
  emit(CreateCagetoryLoadingState());
  FormData formData = FormData.fromMap({
    'ImageFile': [await uploadimagetoapi(imagepicker!)],
    "IsDeleted": isDeleted,
    "Name": name,
    "Description": description,
    "TotalProducts": totalProducts,
  });

  Response response = await DioHelper.postData(
      data: formData, url: ApiConstant.createCactegory, token: token);
  emit(CreateCagetorySuccessState());
}
on DioException catch (e) {
  final dynamic errorMassage =
      e.response?.data;
  debugPrint("errorMassage${errorMassage}");
  emit(CreateCagetoryErrorState(errorMassage));
}
  }




  void updateCagetory ({
    required int id,
    required bool isDeleted,
    required String name,
    required String description,
    required int totalProducts,
  })async{
    try {
      emit(UpdateCagetoryLoadingState());
      FormData formData = FormData.fromMap({
        'ImageFile': [await uploadimagetoapi(imagepicker!)],
        "IsDeleted": isDeleted,
        "Name": name,
        "Description": description,
        "TotalProducts": totalProducts,
      });

      Response response = await DioHelper.putData(
          data: formData, url: ApiConstant.updateCategory(id: id), token: token);
      emit(UpdateCagetorySuccessState());
    }
    on DioException catch (e) {
      final dynamic errorMassage =
          e.response?.data;
      debugPrint("errorMassage${errorMassage}");
      emit(UpdateCagetoryErrorState(errorMassage));
    }
  }




}
uploadimagetoapi(XFile image) {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}
