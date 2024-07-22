import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/category/data/model/category_model.dart';
import 'package:ultra_shop/features/product/data/manger/cubits/product_cubit.dart';
import 'package:ultra_shop/features/product/presentation/screens/create_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/category_details_body.dart';
class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;
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
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: AppColors.myWhite,
            size: 33,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            navigateTo(
                context,
                BlocProvider(
                  create: (context) => ProductCubit(),
                  child: CreateProductScreen(
                    screen: "Category",
                  ),
                ));
          }),
      body: CategoryDetailsBody(categoryModel: categoryModel),
    ));
  }
}

