import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/product/data/manger/cubits/product_cubit.dart';
import 'package:ultra_shop/features/product/presentation/screens/product_details_screen.dart';
import 'package:ultra_shop/features/product/presentation/widgets/custom_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Shimmers/product.dart';

class CustomProductView extends StatelessWidget {
  CustomProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return   (role==AppString.seller)?
    BlocProvider(
      create: (context) => ProductCubit()..getMyProduct(),
      child: SizedBox(
          height: 200.h,
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              var data = ProductCubit.get(context).myProducts;
              return state is GetMyProductSuccessState
                  ? ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    dynamic cubit =
                    ProductCubit.get(context).myProducts[index];
                    return Hero(tag:cubit.id! ,
                      child: CustomProduct( onTap: () {
                        navigateTo(
                            context,
                            ProductDetailsScreen(comming: "product",
                              id: cubit.id!,
                            ));
                      },
                        price: "${cubit.priceProd}",
                        description: cubit.descrip!,
                        urlImage: cubit.imageUrls[0],
                        nameDevice: cubit.itemName!,
                        rating:
                        cubit.averageRate == 0 ? 0 : cubit.averageRate!,
                      ),
                    );
                  })
                  : Center(
                child:SizedBox(
                  height: 200.h,
                  child: ListView.builder(scrollDirection:Axis.horizontal, itemCount: 10, itemBuilder: (context,index){return ProductShimmer();}),
                )
              );
            },
          )),
    ):


      BlocProvider(
      create: (context) => ProductCubit()..getAllProduct(),
      child: SizedBox(
          height: 200.h,
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              var data = ProductCubit.get(context).allProducts;
              return state is GetAllProductSuccessState
                  ? ListView.builder(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        dynamic cubit =
                            ProductCubit.get(context).allProducts[index];
                        return CustomProduct(onTap: () {
                          navigateTo(
                              context,
                              ProductDetailsScreen(
                                id: cubit.id!,
                              ));
                        },
                          price: "${cubit.priceProd}",
                          description: cubit.descrip!,
                          urlImage: cubit.imageUrls[0],
                          nameDevice: cubit.itemName!,
                          rating:
                              cubit.averageRate == 0 ? 0 : cubit.averageRate!,
                        );
                      })
                  : Center(
                      child:SizedBox(
                        height: 200.h,
                        child: ListView.builder(scrollDirection:Axis.horizontal, itemCount: 10, itemBuilder: (context,index){return ProductShimmer();}),
                      )
                    );
            },
          )),
    );
  }
}
