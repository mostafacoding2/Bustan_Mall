import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ultra_shop/features/payment/data/models/stripe_model/payment_intent_model/customer_model.dart';
import '../../../../core/error/server_error.dart';
import '../models/stripe_model/payment_intent_input_model.dart';
import '../service/create_customer_stripe.dart';
import '../service/stripe_service.dart';
import 'checkout_repo.dart';
class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  Customer customer=Customer();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } on StripeException catch (e) {
      return left(ServerFailure(
          errMessage: e.error.message ?? 'Oops there was an error'));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

    @override
    Future<Either<Failure, CustomersModel>> createCustomer({required String name})async {
      try {
        var customersModel=   await customer.createCustomer(name: name);
        return right(customersModel);
      }  catch (e) {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }


