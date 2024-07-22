import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/category/data/cubit/category_cubit.dart';
import 'package:ultra_shop/features/category/presentation/screens/category_details_screen.dart';
import 'package:ultra_shop/features/category/presentation/screens/category_products_screen.dart';
import 'package:ultra_shop/features/category/presentation/widgets/custom_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Shimmers/category.dart';
class CustomCategoryView extends StatelessWidget {
  CustomCategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getAllCategories(),
      child: SizedBox(
          height: 210.h,
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              var Data = CategoryCubit.get(context).allCategory;
              return state is GetAllCategorySuccessState
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Data.length,
                      itemBuilder: (context, index) {
                        var cubit = Data[index];
                        return CustomCategory(
                          onTap: (){
                            (role==AppString.admin)? navigateTo(context, CategoryDetailsScreen(categoryModel:cubit)):
                            navigateTo(context,  cubit.productDtOs.length==0  ?CategoryProductsScreen(
                              lenghtList: 0, productModel: cubit.productDtOs,
                            ): CategoryProductsScreen(
                                lenghtList: cubit.productDtOs.length,
                                productModel: cubit.productDtOs
                            ));
                          },
                          urlImage: cubit.picture,
                          name: cubit.name,
                        );
                      })
                  : SizedBox(
                height: 100.h,
                child: ListView.builder(scrollDirection:Axis.horizontal, itemCount: 10, itemBuilder: (context,index){return CategoryShimmer();}),
              );
            },
          )),
    );
  }
}
//Shimmer.fromColors(
//                           baseColor: Colors.grey[300]!,
//                           highlightColor: Colors.grey[100]!,
//                           child: Container(
//                             color: Colors.white,
//                           ),
//                         ),