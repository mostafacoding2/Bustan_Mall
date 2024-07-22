import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Home/presentation/manger/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/bottom_bar_item.dart';

class BottomNavBody extends StatelessWidget {
  const BottomNavBody({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.myWhite,
      body: cubit.screen[cubit.currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.myWhite,
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(16.r),
            topStart: Radius.circular(16.r),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(152, 173, 175, 0.25),
              offset: Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 3,
            ),
          ],
        ),
        height: 65.h,
        child: ClipRRect(
          clipBehavior: Clip.none,
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(16.r),
            topStart: Radius.circular(16.r),
          ),
          child: BottomAppBar(
            color: AppColors.myWhite,
            elevation: 0,
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Row(
              mainAxisAlignment:
              (role == AppString.seller || role == AppString.admin)
                  ? MainAxisAlignment.spaceAround
                  : MainAxisAlignment.spaceBetween,
              children: [
                BottomBarItem(
                  onPress: () {
                    cubit.changeBottom(0);
                  },
                  icon: Icons.home,
                  isSelected: 0 == cubit.currentIndex,
                ),
                (role == AppString.seller || role == AppString.admin)
                    ? SizedBox(
                  width: 10,
                  height: 0,
                )
                    : BottomBarItem(
                  onPress: () {
                    cubit.changeBottom(1);
                  },
                  icon: Icons.shopping_cart,
                  isSelected: 1 == cubit.currentIndex,
                ),
                (role == AppString.seller || role == AppString.admin)
                    ? SizedBox(
                  width: 10,
                  height: 0,
                )
                    : BottomBarItem(
                  onPress: () {
                    cubit.changeBottom(2);
                  },
                  icon: Icons.add_shopping_cart,
                  isSelected: 2 == cubit.currentIndex,
                ),
                (role == AppString.admin)
                    ? BottomBarItem(
                  onPress: () {
                    cubit.changeBottom(4);
                  },
                  icon: FontAwesomeIcons.fileContract,
                  isSelected: 4 == cubit.currentIndex,
                )
                    : SizedBox(
                  width: 10,
                  height: 0,
                ),
                (role == AppString.admin)
                    ? SizedBox(
                  width: 35,
                )
                    : SizedBox(),
                BottomBarItem(
                  onPress: () {
                    cubit.changeBottom(3);
                  },
                  icon: Icons.person,
                  isSelected: 3 == cubit.currentIndex,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
