part of 'category_cubit.dart';
@immutable
abstract class CategoryState {}
 class CategoryInitial extends CategoryState {}
class GetAllCategoryLoadingState extends CategoryState {}
class uploadimagestate extends CategoryState {}
class GetAllCategoryErrorState extends CategoryState {
 final String errorMessage;
  GetAllCategoryErrorState(this.errorMessage);
}
class GetAllCategoryFailureState extends CategoryState {
 final String failure;
 GetAllCategoryFailureState(this.failure);}
class GetAllCategorySuccessState extends CategoryState {
final  List<CategoryModel> allCategory;
GetAllCategorySuccessState(this.allCategory);
}


class CreateCagetorySuccessState extends CategoryState{}
class CreateCagetoryErrorState extends CategoryState{

 final dynamic errorMessage;

  CreateCagetoryErrorState(this.errorMessage);

}
class CreateCagetoryLoadingState extends CategoryState{}


class UpdateCagetorySuccessState extends CategoryState{}
class UpdateCagetoryErrorState extends CategoryState{

 final dynamic errorMessage;

 UpdateCagetoryErrorState(this.errorMessage);

}
class UpdateCagetoryLoadingState extends CategoryState{}

