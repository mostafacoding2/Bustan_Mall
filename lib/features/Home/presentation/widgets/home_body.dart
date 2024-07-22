import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_home_view.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_carousel_slider.dart';
import 'package:ultra_shop/features/ShopProducts/presentation/screens/shops_screens.dart';
import 'package:ultra_shop/features/ShopProducts/presentation/widgets/custom_shops_view.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/header.dart';
import 'package:ultra_shop/features/category/presentation/screens/Categories_screen.dart';
import 'package:ultra_shop/features/category/presentation/widgets/custom_category_view.dart';
import 'package:ultra_shop/features/product/data/manger/cubits/product_cubit.dart';
import 'package:ultra_shop/features/product/presentation/screens/products_screen.dart';
import 'package:ultra_shop/features/product/presentation/widgets/custom_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  ProductCubit cubit = ProductCubit();
  @override
  void initState() {

    super.initState();
    _fetchProductDetails();
  }

  void _fetchProductDetails() {
    cubit.getAllWorkspacesbySortReview().then((_) {
      // Trigger a manual rebuild when data is ready
      setState(() {});
    });
    cubit.getAllProduct().then((_) {
      // Trigger a manual rebuild when data is ready
      setState(() {});
    });

    }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarHome(),
        (role == AppString.seller||role==AppString.admin)
            ? SizedBox(
          height: 25.h,
        )
            : CustomCarouselSlider(),


        (role == AppString.seller)
            ? HeaderTitle(
          onPressed: () {
            navigateTo(context, ShopsScreen());
          },
          title: 'MyShop',
          seeMore: "See More",
        )
            : HeaderTitle(
          onPressed: () {
            navigateTo(context, ShopsScreen());
          },
          title: 'Shops',
          seeMore: "See More",
        ),


        CustomShopsView(),


        (role == "Seller")
            ? SizedBox(
          height: 5.h,
        )
            : HeaderTitle(
          onPressed: () {
            navigateTo(context, CategoriesScreen());
          },
          title: 'Categories',
          seeMore: "See More",
        ),


        (role == "Seller")
            ? SizedBox(
          height: 10.h,
        )
            : CustomCategoryView(),

        (role == "Seller")?
        Padding(
          padding: const EdgeInsets.only(top:5,bottom: 15),
          child: HeaderTitle(
            onPressed: () {
              navigateTo(context, ProductsScreen());
            },
            title: ' My Products',
            seeMore: "See More",
          ),
        ):
        HeaderTitle(
          onPressed: () {
            navigateTo(context, ProductsScreen());
          },
          title: 'Products',
          seeMore: "See More",
        ),

        CustomProductView(),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}
