import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/header.dart';
import 'package:ultra_shop/features/ShopProducts/data/manger/cubits/shops_cubit.dart';
import 'package:ultra_shop/features/ShopProducts/presentation/widgets/custom_details_shop.dart';
import 'package:ultra_shop/features/category/data/cubit/category_cubit.dart';
import 'package:ultra_shop/features/category/data/model/category_model.dart';
import 'package:ultra_shop/features/category/presentation/screens/update_category_screen.dart';
import 'package:ultra_shop/features/product/presentation/screens/product_details_screen.dart';
import 'package:ultra_shop/features/product/presentation/widgets/custom_product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/Theme/light_theme.dart';

class CategoryDetailsBody extends StatefulWidget {
  const CategoryDetailsBody({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  State<CategoryDetailsBody> createState() => _CategoryDetailsBodyState();
}

class _CategoryDetailsBodyState extends State<CategoryDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => ShopsCubit(),
        child: Column(
          children: [
            CustomAppBarTitleArrow(arrow_back: true,
              icondata: PopupMenuButton<String>(
                  icon: Icon(
                    Icons.menu,
                    color: AppColors.myWhite,
                  ),
                  onSelected: (String choice) {
                    if (choice == 'Update') {
                      navigateTo(
                          context,
                          BlocProvider(
                            create: (context) => CategoryCubit(),
                            child: UpdateCategoryScreen(
                              name: widget.categoryModel.name,
                              description: widget.categoryModel.description,
                              totalProducts: widget.categoryModel.totalProducts,
                              id: widget.categoryModel.id,
                            ),
                          ));
                    } else {
                      return null;
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<String>(
                        value: 'Update',
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.edit,
                              color: AppColors.myNavy,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'update',
                              style: lightTheme.textTheme.labelSmall!.apply(
                                fontSizeFactor: 1.sp,
                                color: AppColors.myNavy,
                              ),
                            )
                          ],
                        ),
                      )
                    ];
                  }),
              isShowed: role == AppString.admin || role == AppString.seller
                  ? true
                  : false,
              title: "Category Details",
              onpressed: () {
                Navigator.pop(context);
              },
            ),
            (role == AppString.admin)
                ? Row(
              children: [
                Spacer(),
                Spacer(
                  flex: 6,
                ),
                Spacer()
              ],
            )
                : SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: widget.categoryModel.picture.split(".").last == "svg"
                  ? SvgPicture.network(
                widget.categoryModel.picture,
                height: 120.h,
                width: 120.w,
                fit: BoxFit.fill,
              )
                  : ClipRRect(
                borderRadius: BorderRadius.circular(360),
                child: CachedNetworkImage(
                  height: 90.h,
                  width: 90.w,
                  fit: BoxFit.fill,
                  imageUrl: widget.categoryModel.picture,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, color: AppColors.myRed),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0.h, right: 18.w, left: 18.w),
              child: Column(
                children: [
                  CustomDetailsShop(
                    title: 'Name Category',
                    content: widget.categoryModel.name,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomDetailsShop(
                    title: 'Description Category',
                    content: widget.categoryModel.description,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomDetailsShop(
                    title: "TotalProducts",
                    content: "${widget.categoryModel.productDtOs.length}",
                  )
                ],
              ),
            ),
            HeaderTitle(
              onPressed: () {},
              arrow: true,
              title: 'Products',
              seeMore: "",
            ),
            SizedBox(
                height: 700.h,
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: widget.categoryModel.productDtOs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                    ),
                    itemBuilder: (context, index) {


                      var cubit = widget.categoryModel.productDtOs[index];
                      return CustomProduct(
                        onTap: () {
                          navigateTo(
                              context,
                              ProductDetailsScreen(
                                  comming: "shop", id: cubit.id!));
                        },
                        price: "${cubit.priceProd}",
                        description: cubit.descrip!,
                        urlImage: cubit.imageUrls![0],
                        nameDevice: cubit.itemName!,
                        rating:
                        cubit.averageRate == 0 ? 0 : cubit.averageRate!,
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
