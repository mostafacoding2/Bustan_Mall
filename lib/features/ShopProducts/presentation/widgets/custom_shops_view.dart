import 'package:ultra_shop/core/Shimmers/shop.dart';
import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/ShopProducts/data/manger/cubits/shops_cubit.dart';
import 'package:ultra_shop/features/ShopProducts/presentation/screens/shop_details_screen.dart';
import 'package:ultra_shop/features/ShopProducts/presentation/screens/shop_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:ultra_shop/features/ShopProducts/presentation/widgets/custom_shops.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShopsView extends StatelessWidget {
  CustomShopsView({super.key});

  @override
  Widget build(BuildContext context) {
    return
      (role==AppString.seller)?BlocProvider(
        create: (context) =>           ShopsCubit()..getMyShops(),
        child: SizedBox(
            height: 210.h,
            child: BlocBuilder<ShopsCubit, ShopsState>(
              builder: (context, state) {
                var Data = ShopsCubit.get(context).myShops;
                return state is GetMyShopsSuccessState
                    ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Data.length,
                    itemBuilder: (context, index) {
                      var cubit = Data[index];

                      return CustomShops(onTap: () {
                        (role == AppString.admin||role==AppString.seller)? navigateTo(
                            context,

                            ShopDetailsScreen(shopsModel:cubit))   : navigateTo(
                            context,
                            cubit.productDtOs?.length == 0
                                ? ShopProductsScreen(
                              lenghtList: 0,
                              productModel:
                              cubit.productDtOs,
                            )
                                : ShopProductsScreen(
                                lenghtList: cubit
                                    .productDtOs?.length,
                                productModel:
                                cubit.productDtOs));



                      },
                        theDoorNumber: cubit.theDoorNumber!,
                        name: cubit.name!,
                        urlImage: cubit.imagePath!,
                      );
                    })
                    : SizedBox(
                    height: 100.h,
                child: ListView.builder(scrollDirection:Axis.horizontal, itemCount: 10, itemBuilder: (context,index){return ShopShimmer();}),
                );
              },
            )),
      ):
      BlocProvider(
      create: (context) =>           ShopsCubit()..getAllShopProducts(),
      child: SizedBox(
          height: 210.h,
          child: BlocBuilder<ShopsCubit, ShopsState>(
            builder: (context, state) {
              var Data = ShopsCubit.get(context).allShop;
              return state is GetAllShopProductsSuccessState
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Data.length,
                      itemBuilder: (context, index) {
                        var cubit = Data[index];

                        return CustomShops(  onTap: () {
                          (role == AppString.admin||role==AppString.seller)? navigateTo(
                              context,

                              ShopDetailsScreen(shopsModel:cubit))   : navigateTo(
                              context,
                              cubit.productDtOs?.length == 0
                                  ? ShopProductsScreen(
                                lenghtList: 0,
                                productModel:
                                cubit.productDtOs,
                              )
                                  : ShopProductsScreen(
                                  lenghtList: cubit
                                      .productDtOs?.length,
                                  productModel:
                                  cubit.productDtOs));



                        },
                          theDoorNumber: cubit.theDoorNumber!,
                          name: cubit.name!,
                          urlImage: cubit.imagePath!,
                        );
                      })
                  : SizedBox(
                height: 210.h,
                child: ListView.builder( scrollDirection:Axis.horizontal,itemCount: 10, itemBuilder: (context,index){return ShopShimmer();}),
              );
            },
          )),
    );
  }
}
