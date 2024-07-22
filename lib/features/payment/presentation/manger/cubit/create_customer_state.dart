part of 'create_customer_cubit.dart';
@immutable
abstract class CreateCustomerState {}
 class CreateCustomerInitialState extends CreateCustomerState {}
 class CreateCustomerLoadingState extends CreateCustomerState {}
 class CreateCustomerSuccessState extends CreateCustomerState {
  final CustomersModel customersModel;
  CreateCustomerSuccessState(this.customersModel);
 }
 class CreateCustomerErrorState extends CreateCustomerState {
  final String errorMessage;
  CreateCustomerErrorState(this.errorMessage);
 }
