import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/update_category_body.dart';
class UpdateCategoryScreen extends StatefulWidget {
  const UpdateCategoryScreen({super.key, required this.id,
  required this.description,
  required this.totalProducts,
  required this.name

  });
  final int id;
 final  String name;
  final String description;
  final int totalProducts;
  @override
  State<UpdateCategoryScreen> createState() => _UpdateCategoryScreenState();
}
class _UpdateCategoryScreenState extends State<UpdateCategoryScreen> {
  TextEditingController nameCategoryController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController TotalProductsController=TextEditingController();
  bool selectedChoice = false;
  GlobalKey<FormState>fromkey=GlobalKey();
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

    nameCategoryController.text=widget.name;
    descriptionController.text=widget.description;
    TotalProductsController.text="${widget.totalProducts}";

    return SafeArea(
        child: Scaffold(
            body:     Form(key: fromkey,
                child: UpdateCategoryBody(
                    id: widget.id,
                    name: widget.name,
                    description: widget.description,
                    totalProducts: widget.totalProducts,
                    nameCategoryController: nameCategoryController,
                    descriptionController: descriptionController,
                    TotalProductsController: TotalProductsController,
                    fromkey: fromkey)
            )
 ));
  }
}
