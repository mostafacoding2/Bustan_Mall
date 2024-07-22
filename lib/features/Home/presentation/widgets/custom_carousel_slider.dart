import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/product/data/manger/cubits/product_cubit.dart';
import 'package:ultra_shop/features/product/presentation/screens/product_details_screen.dart';
import '../../../../core/Shimmers/offers.dart';
import 'custom_discount.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: double.infinity,
      child: BlocProvider(
        create: (context) => ProductCubit()..getAllWorkspacesbySortReview(),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            var cubit = ProductCubit.get(context).WorkspacesbySortReview;

            return state is! GetAllProductLoadingState
                ? (cubit.length == 0)
                    ? OffersShimmers()
                    : CarouselSlider(
                        items: cubit
                            .map((e) => CustomDiscount(
                                  onTap: () {
                                    navigateTo(
                                        context,
                                        ProductDetailsScreen(
                                          id: e.id!,
                                        ));
                                  },
                                  imageUrls: e.imageUrls![0],
                                  averageRate: e.averageRate!,
                                  description: e.descrip!,
                                  itemName: e.itemName!,
                                ))
                            .toList(),
                        options: CarouselOptions(
                          aspectRatio: 1,
                          viewportFraction: 1.4,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 2),
                          autoPlayAnimationDuration: const Duration(seconds: 1),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                        ))
                : Text("not found ");
          },
        ),
      ),
    );
  }
}
