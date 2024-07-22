import 'package:ultra_shop/core/utils/app_color.dart';

import 'package:ultra_shop/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/shop_products_body.dart';
class ShopProductsScreen extends StatelessWidget {
  final int? lenghtList;
  final List<ProductModel>? productModel;
  const ShopProductsScreen({super.key, this.lenghtList, this.productModel});
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

        body: ShopProductsBody(lenghtList: lenghtList, productModel: productModel),
      ),
    );
  }
}

