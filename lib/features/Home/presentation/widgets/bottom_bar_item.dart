import 'package:ultra_shop/core/utils/app_color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBarItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onPress;
  const BottomBarItem({
    Key? key,
    required this.icon,
    this.isSelected = true,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: isSelected ? Offset(0, -30.h) : const Offset(0, 0),
      child: Container(
        padding: EdgeInsetsDirectional.only(
          top: 0.h,
        ),
        decoration: isSelected
            ? BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFE1E1E1),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        )
            : null,
        width: 56.w,
        height: 56.h,
        child: InkWell(
          radius: 0,
          hoverColor: AppColors.myWhite,
          onTap: onPress,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  icon,
                  size: 25.h,
                  color:
                  isSelected ? AppColors.myWhite : const Color(0xffA4AAAB),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
