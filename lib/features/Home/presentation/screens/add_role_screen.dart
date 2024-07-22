import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/add_role_body.dart';

class AddRoleScreen extends StatefulWidget {
  const AddRoleScreen({super.key});
  @override
  State<AddRoleScreen> createState() => _AddRoleScreenState();
}

class _AddRoleScreenState extends State<AddRoleScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController roleNameController = TextEditingController();

  GlobalKey<FormState> fromkey = GlobalKey();
  @override
  void dispose() {
    // TODO: implement dispose
    userNameController.dispose();
    roleNameController.dispose();
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
            body: Form(
      key: fromkey,
      child: AddRoleBody(
          userNameController: userNameController,
          roleNameController: roleNameController,
          fromkey: fromkey),
    )));
  }
}
