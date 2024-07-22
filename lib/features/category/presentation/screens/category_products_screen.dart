import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/category_Products_body.dart';
class CategoryProductsScreen extends StatelessWidget {
  final int? lenghtList;
  final  List<ProductModel>? productModel;
  const CategoryProductsScreen({super.key,  this.lenghtList, this.productModel});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return  SafeArea(
      child: Scaffold(
        body: CategoryProductsBody(lenghtList: lenghtList, productModel: productModel),
      ),
    );
  }
}

