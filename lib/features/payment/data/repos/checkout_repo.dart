import 'package:dartz/dartz.dart';
import '../../../../core/error/server_error.dart';
import '../models/stripe_model/payment_intent_input_model.dart';
import '../models/stripe_model/payment_intent_model/customer_model.dart';
abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel});
  Future<Either<Failure, CustomersModel>> createCustomer({required String name});




}
