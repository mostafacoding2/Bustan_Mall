import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/ApplyShop/presentation/controller/applyshop_cubit.dart';
import 'package:ultra_shop/features/Home/presentation/screens/bottom_nav_screen.dart';
import 'package:ultra_shop/features/ShopProducts/data/manger/cubits/shops_cubit.dart';
import 'package:ultra_shop/features/ShopProducts/presentation/widgets/custom_details_shop.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Order/presentation/widgets/custom_cancel.dart';

class CustomFormApplyShop extends StatelessWidget {
  const CustomFormApplyShop(
      {super.key,
      required this.businessName,
      required this.theDoorNumber,
      required this.businessPhone,
      required this.email,
      required this.country,
      required this.nationalId,
      required this.userId,
      required this.urlImage,
      required this.id});
  final String businessName,
      theDoorNumber,
      businessPhone,
      email,
      country,
      nationalId,
      userId,
      urlImage;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.myWhite,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(191, 214, 215, 1),
                offset: Offset(1, 1),
                spreadRadius: 0,
                blurRadius: 4)
          ]),
      child: Row(
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomDetailsShop(title: "BusinessName", content: businessName),
              CustomDetailsShop(title: "TheDoorNumber", content: theDoorNumber),
              CustomDetailsShop(title: "BusinessPhone", content: businessPhone),
              CustomDetailsShop(title: "Email", content: email),
              CustomDetailsShop(title: "Country", content: country),
              CustomDetailsShop(title: "National Id", content: nationalId),
              CustomDetailsShop(title: "UserId", content: userId),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  BlocProvider(
                    create: (context) => ShopsCubit(),
                    child: BlocConsumer<ShopsCubit, ShopsState>(
                      listener: (context, state) {
                        if (state is CreateShopsSuccessState) {
                          flutterToast(
                              message: "create shop success", success: true);
                          ApplyshopCubit.get(context).deleteApplyShop(id: id);
                          navigateTo(
                              context,
                              BottomNavScreen(
                                currentIndex: 0,
                              ));
                        }
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return CustomCancel(
                          isColored: false,
                          onTap: () {
                            ShopsCubit.get(context).createShop(
                                imagePath: urlImage,
                                name: businessName,
                                theDoorNumber: theDoorNumber,
                                phoneNumber: businessPhone,
                                userId: userId,
                                email: email);
                          },
                          widget: Center(
                            child: Text(
                              "Accept ",
                              style: lightTheme.textTheme.displayMedium!.apply(
                                overflow: TextOverflow.ellipsis,
                                fontSizeFactor: 1.sp,
                                color: AppColors.myWhite,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  BlocBuilder<ApplyshopCubit, ApplyShopState>(
                    builder: (context, state) {
                      if (state is DeleteApplyShopSuccessState) {
                        ApplyshopCubit.get(context)..getAllApplyShop();
                      }
                      return CustomCancel(
                        onTap: () {
                          ApplyshopCubit.get(context).deleteApplyShop(id: id);
                        },
                        widget: Center(
                          child: Text(
                            "Cancel ",
                            style: lightTheme.textTheme.displayMedium!.apply(
                              overflow: TextOverflow.ellipsis,
                              fontSizeFactor: 1.sp,
                              color: AppColors.myWhite,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ]),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CachedNetworkImage(
              width: 70.w,
              height: 70.h,
              fit: BoxFit.fill,
              imageUrl: urlImage,
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
        ],
      ),
    );
  }
}
