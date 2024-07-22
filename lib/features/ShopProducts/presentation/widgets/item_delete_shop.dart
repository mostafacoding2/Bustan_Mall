import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/ShopProducts/data/manger/cubits/shops_cubit.dart';
import 'package:ultra_shop/features/ShopProducts/presentation/screens/shops_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shop/core/Theme/light_theme.dart';

class ItemDeleteShop extends StatelessWidget {
  const ItemDeleteShop({super.key, required this.title, required this.id});
  final String title;
  final int id;
  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
        backgroundColor: AppColors.myWhite,
        content: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          height: 200.h,
          width: 327.w,
          child: Column(
            children: [
              Text(
                "Warning",
                style: lightTheme.textTheme.labelMedium!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                height: 53.h,
              ),
              Text(
                title,
                style: lightTheme.textTheme.displaySmall!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.myDark,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  const Spacer(),
                  BlocProvider(
                    create: (context) => ShopsCubit(),
                    child: BlocConsumer<ShopsCubit, ShopsState>(
                      listener: (context, state) {
                        if (state is DeleteShopsErrorState) {
                          flutterToast(
                              message: "Shop product contains shop",
                              success: false);
                        }
                        if (state is DeleteShopsSuccessState) {
                          flutterToast(
                              message: "Deleted success", success: false);
                          navigateAndReplacement(context, ShopsScreen());
                        }
                      },
                      builder: (context, state) {
                        return InkWell(
                          onTap: () {
                            ShopsCubit.get(context).deleteShop(id: id);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.r),
                            height: 40.w,
                            decoration: BoxDecoration(
                                color: AppColors.myRed,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Center(
                              child: Text("Sure",
                                  style:
                                      lightTheme.textTheme.labelMedium!.apply(
                                    fontSizeFactor: 1.sp,
                                    color: AppColors.myWhite,
                                  )),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.r),
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: AppColors.myBlueGrey,
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Center(
                          child: Text("Cancel",
                              style: lightTheme.textTheme.labelMedium!.apply(
                                fontSizeFactor: 1.sp,
                                color: AppColors.myWhite,
                              ))),
                    ),
                  ),
                  SizedBox(
                    width: 24.h,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
