import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/seller_shops_body.dart';
import '../widgets/shops_body.dart';
class ShopsScreen extends StatelessWidget {
  ShopsScreen({super.key});
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
      child: (role == AppString.seller)
          ? SellerShopsBody()
          : ShopsBody(),
    );
  }
}



