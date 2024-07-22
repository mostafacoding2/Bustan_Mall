part of 'cart_cubit.dart';
@immutable
abstract class CartState {}
 class CartInitialState extends CartState {}
 class PaymentSelectedState extends CartState {
 final int index;
 PaymentSelectedState(this.index);
 }
 class AddProductToCartLoadingState extends CartState {}
 class AddProductToCartErrorState extends CartState {
 final String errorMessage;
  AddProductToCartErrorState(this.errorMessage);
 }
 class AddProductToCartSuccessState extends CartState {}


class ViewCartLoadingState extends CartState {}
class ViewCartErrorState extends CartState {
 final String errorMessage;
 ViewCartErrorState(this.errorMessage);
}
class ViewCartSuccessState extends CartState {
final List<ViewCartModel>viewcartproducts;
ViewCartSuccessState(this.viewcartproducts);
}






class DeleteProductFromCartLoadingState extends CartState {}
class DeleteProductFromCartErrorState extends CartState {
 final String errorMessage;
 DeleteProductFromCartErrorState(this.errorMessage);
}
class DeleteProductFromCartSuccessState extends CartState {}




class GetTotalPaymentLoadingState extends CartState {}
class GetTotalPaymentErrorState extends CartState {
 final String errorMessage;
 GetTotalPaymentErrorState(this.errorMessage);
}
class GetTotalPaymentSuccessState extends CartState {
 final String price;
 GetTotalPaymentSuccessState(this.price);
}






