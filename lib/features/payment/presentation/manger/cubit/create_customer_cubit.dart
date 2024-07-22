import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/stripe_model/payment_intent_model/customer_model.dart';
import '../../../data/repos/checkout_repo.dart';
part 'create_customer_state.dart';
class CreateCustomerCubit extends Cubit<CreateCustomerState> {
  CreateCustomerCubit(this.checkoutRepo) : super(CreateCustomerInitialState());
  static CreateCustomerCubit get(context)=>BlocProvider.of(context);
  CheckoutRepo checkoutRepo;
  Future createCustomer({required String name})
  async{
    emit(CreateCustomerLoadingState());
 dynamic data=   await checkoutRepo.createCustomer(name: name);
 data.fold((l){
   emit(CreateCustomerErrorState(l.errMessage));
 }, (r){
   emit(CreateCustomerSuccessState(r));
 });
  }
}
