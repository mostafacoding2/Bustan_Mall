part of 'applyshop_cubit.dart';
@immutable
abstract class ApplyShopState {}
 class ApplyShopInitialState extends ApplyShopState {}
class uploadimagestate extends ApplyShopState {}
 class ApplyShopLoadingState extends ApplyShopState {}
 class ApplyShopSuccessState extends ApplyShopState {}
 class ApplyShopErrorState extends ApplyShopState {
 final String errorMessage;
 ApplyShopErrorState(this.errorMessage);
 }

class AppliesShopsLoadingState extends ApplyShopState {}
class AppliesShopsSuccessState extends ApplyShopState {
final List<ApplyFormModel>appliesShop;
 AppliesShopsSuccessState(this.appliesShop);

}
class AppliesShopsErrorState extends ApplyShopState {
 final String errorMessage;
 AppliesShopsErrorState(this.errorMessage);
}



class DeleteApplyShopLoadingState extends ApplyShopState {}
class DeleteApplyShopSuccessState extends ApplyShopState {
 final String message;
 DeleteApplyShopSuccessState(this.message);
}
class DeleteApplyShopErrorState extends ApplyShopState {
 final String errorMessage;
 DeleteApplyShopErrorState(this.errorMessage);
}