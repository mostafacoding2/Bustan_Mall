import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/header.dart';
import 'package:ultra_shop/features/ShopProducts/data/manger/cubits/shops_cubit.dart';
import 'package:ultra_shop/features/ShopProducts/data/model/shop_model.dart';
import 'package:ultra_shop/features/ShopProducts/presentation/screens/update_shop_screen.dart';
import 'package:ultra_shop/features/ShopProducts/presentation/widgets/custom_details_shop.dart';
import 'package:ultra_shop/features/product/presentation/screens/product_details_screen.dart';
import 'package:ultra_shop/features/product/presentation/widgets/custom_product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'item_delete_shop.dart';
class ShopDetailsBody extends StatelessWidget {
  const ShopDetailsBody({
    super.key,
    required this.shopsModel,
  });

  final ShopsModel? shopsModel;

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
                    if (choice == 'Delete') {
                      showDialog(
                          barrierColor: const Color.fromRGBO(
                              0, 100, 102, 0.2),
                          context: context,
                          builder: (BuildContext context) {return ItemDeleteShop(
                            id: shopsModel!.id!,
                            title:
                            "Do you want to delete shop ?",
                          );
                          });
                    } else if (choice == 'Update') {
                      navigateTo(
                        context,
                        UpdateShopScreen(
                          name: shopsModel!.name!,
                          theDoorNumber: shopsModel!.theDoorNumber!,
                          phoneNumber: shopsModel!.phoneNumber!,
                          id: shopsModel!.id,
                          fileImage: shopsModel!.imagePath!,
                        ),
                      );
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<String>(
                        value: 'Delete',
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: AppColors.myRed,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'delete',
                              style: lightTheme
                                  .textTheme.labelSmall!
                                  .apply(
                                fontSizeFactor: 1.sp,
                                color: AppColors.myRed,
                              ),
                            )
                          ],
                        ),
                      ),
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
                              style: lightTheme
                                  .textTheme.labelSmall!
                                  .apply(
                                fontSizeFactor: 1.sp,
                                color: AppColors.myNavy,
                              ),
                            )
                          ],
                        ),
                      )
                    ];
                  }),
              isShowed: role == AppString.admin
                  ? true
                  : false,
              title: "Shop Details",
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
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                width: 350.w,
                height: 190.h,
                fit: BoxFit.fill,
                imageUrl: shopsModel!.imagePath!,
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
            Padding(
              padding: EdgeInsets.only(top: 18.0.h, right: 18.w, left: 18.w),
              child: Column(
                children: [
                  CustomDetailsShop(
                    title: 'Name',
                    content: shopsModel!.name!,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomDetailsShop(
                    title: 'The Floor Number',
                    content: shopsModel!.theDoorNumber!,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomDetailsShop(
                    title: "Phone Number",
                    content: shopsModel!.phoneNumber!,
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
                    itemCount: shopsModel!.productDtOs!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                    ),
                    itemBuilder: (context, index) {
                      var cubit = shopsModel!.productDtOs![index];
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