import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/products_body.dart';
import '../widgets/products_seller_body.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});
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
      child:     (role==AppString.seller) ?ProductsSellerBody():
      ProductsBody() ,
    );
  }
}

