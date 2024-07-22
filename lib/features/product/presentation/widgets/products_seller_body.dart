import 'package:ultra_shop/core/Shimmers/product.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Home/presentation/screens/bottom_nav_screen.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import 'package:ultra_shop/features/product/data/manger/cubits/product_cubit.dart';
import 'package:ultra_shop/features/product/presentation/screens/create_product.dart';
import 'package:ultra_shop/features/product/presentation/screens/product_details_screen.dart';
import 'package:ultra_shop/features/product/presentation/widgets/custom_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsSellerBody extends StatelessWidget {
  const ProductsSellerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getMyProduct(),
      child: Scaffold(
        floatingActionButton:
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
              create: (context) => ProductCubit(),
              child: CreateProductScreen(screen: "product",),
            ));}),
        body: Column(
          children: [
            CustomAppBarTitleArrow(arrow_back: true,
                title: "Products ",
                onpressed: () {
                  navigateTo(
                      context,
                      BottomNavScreen(
                        currentIndex: 0,
                      ));
                }),
            Expanded(
              child: BlocConsumer<ProductCubit, ProductState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var Data = ProductCubit.get(context).myProducts;

                  return state is GetMyProductSuccessState
                      ? GridView.builder(
                      itemCount: Data.length,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        var cubit =
                        ProductCubit.get(context).myProducts[index];
                        return CustomProduct(
                          onTap: () {
                            navigateTo(
                                context,
                                ProductDetailsScreen(comming: "product",
                                  id: cubit.id!,
                                ));
                          },
                          price: "${cubit.priceProd}",
                          description: cubit.descrip!,
                          urlImage: cubit.imageUrls![0],
                          nameDevice: cubit.itemName!,
                          rating: cubit.averageRate == 0
                              ? 0
                              : cubit.averageRate!,
                        );
                      })
                      : GridView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ProductShimmer();
                    },
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 0.604),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
