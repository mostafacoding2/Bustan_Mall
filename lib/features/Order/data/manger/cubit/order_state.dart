part of 'order_cubit.dart';

@immutable
abstract class OrderState {}
 class OrderInitial extends OrderState {}
 class CheckOutOrderLoadingState extends OrderState {}
 class CheckOutOrderErrorState extends OrderState {
  final String errorMessage;
  CheckOutOrderErrorState(this.errorMessage);
 }
 class CheckOutOrderSuccessState extends OrderState {
 final String message;
 CheckOutOrderSuccessState(this.message);
 }
class ViewOrdersLoadingState extends OrderState {}
class ViewOrdersErrorState extends OrderState {
 final String errorMessage;
 ViewOrdersErrorState(this.errorMessage);
}
class ViewOrdersSuccessState extends OrderState {
 final List<OrderModel> orders;
 ViewOrdersSuccessState(this.orders);
}

class CancelOrderSuccessState extends OrderState {}
class CancelOrderLoadingState extends OrderState {}
class CancelOrderErrorState extends OrderState {
 final String error;
 CancelOrderErrorState(this.error);
}
