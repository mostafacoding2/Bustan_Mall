import 'package:ultra_shop/features/ApplyShop/data/models/apply_form_model.dart';
import 'package:dio/dio.dart';
import 'package:ultra_shop/core/utils/api_constant.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/core/utils/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
part 'applyshop_state.dart';
class ApplyshopCubit extends Cubit<ApplyShopState> {
  ApplyshopCubit() : super(ApplyShopInitialState());
  static ApplyshopCubit get(context) => BlocProvider.of(context);
  XFile? imagepicker;
  pickImage(XFile image) {
    imagepicker = image;
    emit(uploadimagestate());
  }
  void postApplyShop({
    required String businessPhone,
    required String email,
    required String businessName,
    required String theDoorName,
    required String country,
    required String nationalId,
  }) async {
    try {
      emit(ApplyShopLoadingState());
      FormData formData = FormData.fromMap({
        'IDPhoto': [await uploadimagetoapi(imagepicker!)],
        "BusinessPhone": businessPhone,
        "Email": email,
        "BusinessName": businessName,
        "TheDoorName": theDoorName,
        "Country": country,
        "ISBN": nationalId,
      });
      Response response = await DioHelper.postData(
          data: formData, token: token, url: ApiConstant.postApplyShop);
      emit(ApplyShopSuccessState());
      print(response.data);
      return response.data;
    } on DioException catch (e) {
      emit(ApplyShopErrorState(e.toString()));
    }
  }
   List<ApplyFormModel>appliesShop=[];
Future getAllApplyShop()async{
  try{
    emit (AppliesShopsLoadingState());
    Response response=await DioHelper.getData(bearerToken: token,url: ApiConstant.getAllApply);
    appliesShop=(response.data as List<dynamic>).map((e) => ApplyFormModel.fromJson(e)).toList();
    emit(AppliesShopsSuccessState(appliesShop));
}on DioException catch (e) {
    emit(AppliesShopsErrorState(e.toString()));
  }

}

void deleteApplyShop({required int id})async {
  try {
    emit(DeleteApplyShopLoadingState());
    Response response = await DioHelper.deleteData(
        token: token, url: ApiConstant.deleteApplyShop(id: id));
    emit(DeleteApplyShopSuccessState(response.data));
  } on DioException catch (e) {
    emit(DeleteApplyShopErrorState(e.toString()));
  }
}




}
uploadimagetoapi(XFile image) {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}
