import 'package:ultra_shop/core/utils/api_constant.dart';
import 'api_service.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/shared _pref.dart';
import '../models/stripe_model/payment_intent_model/customer_model.dart';
class Customer {
  ApiService apiService = ApiService();
  Future<CustomersModel> createCustomer({required String name}) async {
    var response = await apiService.post(
        token: ApiConstant.SecretKey,
        contentType: ApiConstant.contentType,
        body: {"name": name},
        url: ApiConstant.createCustomers);
    CustomersModel customersModel = CustomersModel.fromJson(response.data);
    PreferenceUtils.setString(SharedKeys.customerId, customersModel.id);
    customerId = customersModel.id;
    return customersModel;
  }
}
