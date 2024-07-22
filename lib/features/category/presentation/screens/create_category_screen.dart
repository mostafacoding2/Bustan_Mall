import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/create_category_body.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({super.key});
  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  TextEditingController nameCategoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController TotalProductsController = TextEditingController();
  GlobalKey<FormState> fromkey = GlobalKey();
  @override
  void dispose() {
    // TODO: implement dispose
    nameCategoryController.dispose();
    descriptionController.dispose();
    TotalProductsController.dispose();
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
                child: CreateCategoryBody(
                    nameCategoryController: nameCategoryController,
                    descriptionController: descriptionController,
                    TotalProductsController: TotalProductsController,
                    fromkey: fromkey))));
  }
}
