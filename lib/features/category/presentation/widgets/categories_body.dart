import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Home/presentation/screens/bottom_nav_screen.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import 'package:ultra_shop/features/category/data/cubit/category_cubit.dart';
import 'package:ultra_shop/features/category/presentation/screens/category_details_screen.dart';
import 'package:ultra_shop/features/category/presentation/screens/category_products_screen.dart';
import 'package:ultra_shop/features/category/presentation/widgets/custom_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Shimmers/category.dart';
class CategoriesBody extends StatelessWidget {
  const CategoriesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomAppBarTitleArrow(arrow_back: true,
        title:"Categories " ,onpressed:(){navigateTo(context, BottomNavScreen(currentIndex: 0,));} ,),
      Expanded(
        child: BlocConsumer<CategoryCubit, CategoryState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var Data= CategoryCubit.get(context).allCategory;
            return  state is GetAllCategorySuccessState? GridView.builder(itemCount: Data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 0.604), itemBuilder: (context,index){
                  var cubit=Data[index];
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
                    urlImage:cubit.picture , name:cubit.name,);
                }):
            GridView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return CategoryShimmer();
              },
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 0.604),
            );
          },
        ),
      )
    ],);
  }
}
