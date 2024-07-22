import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/category/data/cubit/category_cubit.dart';
import 'package:ultra_shop/features/category/presentation/screens/create_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/categories_body.dart';
class CategoriesScreen extends StatelessWidget {
   CategoriesScreen({super.key});
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
      child: BlocProvider(
        create: (context) => CategoryCubit()..getAllCategories(),
  child: Scaffold(
    floatingActionButton:(role==AppString.admin)?
    FloatingActionButton(
        child: Icon(
          Icons.add,
          color: AppColors.myWhite,
          size: 33,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(360)),
        backgroundColor: AppColors.primaryColor,
        onPressed: () {navigateTo(context, BlocProvider(
  create: (context) => CategoryCubit(),
  child: CreateCategoryScreen(),
));}):SizedBox(),
            body: CategoriesBody(),
          ),
),
    );
  }
}

