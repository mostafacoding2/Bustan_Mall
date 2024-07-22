
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ultra_shop/core/utils/api_constant.dart';
import '../../../../core/utils/constants.dart';
import '../models/stripe_model/ephemeral_key_model/ephemeral_key_model.dart';
import '../models/stripe_model/payment_intent_input_model.dart';
import '../models/stripe_model/payment_intent_model/payment_intent_model.dart';
import 'api_service.dart';

class StripeService {
  ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var response = await apiService.post(
        token: ApiConstant.SecretKey,
        contentType: ApiConstant.contentType,
        body: paymentIntentInputModel.toJson(),
        url: ApiConstant.paymentIntents);
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }
  // # Create an Ephemeral Key for the Customer
  // curl https://api.stripe.com/v1/ephemeral_keys \
  // -u sk_test_51PZxtKRuX94qM5mKfveVnS9WeH7rd4mwrC3wGdFnuYW8jtkSBTyu08EIJl7WtCEkGaGWyh5CDcyZfxrynsmvgVq700O3NoHmuM: \
  // -H "Stripe-Version: 2024-06-20" \
  // -X "POST" \
  // -d "customer"="{{CUSTOMER_ID}}" \
  Future<EphemeralKeyModel> createEphemeralKey() async {
    var response = await apiService.post(
       headers: {
    'Authorization': "Bearer ${ApiConstant.SecretKey}",
      "Stripe-Version":"2024-06-20"
    },
        body: {"customer":customerId},
        contentType: ApiConstant.contentType,
        url: "https://api.stripe.com/v1/ephemeral_keys");
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret,required String customerEphemeralKeySecret }) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(customerId:customerId ,
             customerEphemeralKeySecret: customerEphemeralKeySecret,
            paymentIntentClientSecret: paymentIntentClientSecret,
            merchantDisplayName: "mostafa"));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(
        paymentIntentInputModel: paymentIntentInputModel);
    var ephemeralKeyModel=await createEphemeralKey();

    await initPaymentSheet(customerEphemeralKeySecret:ephemeralKeyModel.secret!,
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
