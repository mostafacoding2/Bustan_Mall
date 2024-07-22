import 'package:dio/dio.dart';
import 'package:ultra_shop/core/utils/api_constant.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/core/utils/dio_helper.dart';
import 'package:ultra_shop/features/product/data/models/failure_review.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'review_state.dart';
class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewInitial());
  static ReviewCubit get(context) => BlocProvider.of(context);
void review ({
  FailureReview? failureReview,
  required int productId,
  required int rating ,
  required String comment ,
})async{
  try{
    emit(ReviewLoadingState());
  final formData = FormData.fromMap({
    'Rating': rating ,
    'Comment': comment,
  });
    var   response=await DioHelper.postData(token:token,data:formData,url: ApiConstant.review(id: productId),);
    emit(ReviewSuccessState());
}
  on DioException catch(e){
    if(e.response?.data is Map<String ,dynamic>){
      failureReview=FailureReview.fromJson(e.response?.data);
      emit(ReviewErrorState((failureReview)));}
     else{
      String errormessage=e.response?.data;
      print(errormessage);
    emit(ReviewFailureState((errormessage)));}
  }
}
}