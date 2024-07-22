import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/features/ApplyShop/presentation/widgets/create_apply_shop_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class ApplyShopScreen extends StatefulWidget {
  const ApplyShopScreen({super.key});
  @override
  State<ApplyShopScreen> createState() => _ApplyShopScreenState();
}
class _ApplyShopScreenState extends State<ApplyShopScreen> {
  TextEditingController businessPhoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController theDoorNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  GlobalKey<FormState> fromkey = GlobalKey();
  @override
  void dispose() {
    // TODO: implement dispose
    businessPhoneController.dispose();
    emailController.dispose();
    businessNameController.dispose();
    theDoorNameController.dispose();
    countryController.dispose();
    nationalIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return SafeArea(
        child: Scaffold(
            body: CreateApplyShopBody(
                fromkey: fromkey,
                businessPhoneController: businessPhoneController,
                emailController: emailController,
                businessNameController: businessNameController,
                theDoorNameController: theDoorNameController,
                countryController: countryController,
                nationalIdController: nationalIdController)));
  }
}
