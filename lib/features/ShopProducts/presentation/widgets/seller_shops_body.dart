import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Home/presentation/screens/bottom_nav_screen.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import 'package:ultra_shop/features/ShopProducts/data/manger/cubits/shops_cubit.dart';
import 'package:ultra_shop/features/ShopProducts/presentation/screens/shop_details_screen.dart';
import 'package:ultra_shop/features/ShopProducts/presentation/widgets/custom_shops.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Shimmers/shop.dart';

class SellerShopsBody extends StatelessWidget {
  const SellerShopsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopsCubit()..getMyShops(),
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarTitleArrow(
                arrow_back: true,
                title: "Shops ",
                onpressed: () {
                  navigateTo(
                      context,
                      BottomNavScreen(
                        currentIndex: 0,
                      ));
                }),
            Expanded(
              child: BlocBuilder<ShopsCubit, ShopsState>(
                builder: (context, state) {
                  var Data = ShopsCubit.get(context).myShops;
                  return state is GetMyShopsSuccessState
                      ? GridView.builder(
                          itemCount: Data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 0.604),
                          itemBuilder: (context, index) {
                            var cubit = Data[index];
                            return CustomShops(
                              onTap: () {
                                navigateTo(context,
                                    ShopDetailsScreen(shopsModel: cubit));
                              },
                              urlImage: cubit.imagePath!,
                              theDoorNumber: cubit.theDoorNumber!,
                              name: cubit.name!,
                            );
                          })
                      : GridView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return ShopShimmer();
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
