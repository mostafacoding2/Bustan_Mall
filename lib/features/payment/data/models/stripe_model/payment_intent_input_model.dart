import '../../../../../core/utils/constants.dart';
class PaymentIntentInputModel {
  final String amount;
const  PaymentIntentInputModel(
      {
        required this.amount, });
  toJson() {
    return {
      'amount': '${amount}00',
      'currency': "USD",
      'customer': customerId
    };
  }
}
