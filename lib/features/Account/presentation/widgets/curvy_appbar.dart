import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CurvyAppBar extends StatelessWidget {
  const CurvyAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(375, 300),
      painter: RPSCustomPainter(),

    child:  Center(
      child: CustomAppBar(
        title: title
        ,),
    ),
            );
  }
}

class CustomAppBar extends StatelessWidget {
  const  CustomAppBar({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70.h,
        ),
        Align(alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: lightTheme.textTheme.labelLarge!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.myWhite,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(328.851,102.485);
    path_0.cubicTo(164.541,182.88,178.982,291.89,33.985,243.43);
    path_0.cubicTo(-54.8258,213.749,-42.4131,45.8338,40.9294,-83.3157);
    path_0.cubicTo(124.272,-212.465,256.288,-275.569,335.795,-224.261);
    path_0.cubicTo(415.302,-172.954,434.816,66.8635,328.851,102.485);
    path_0.close();
    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff002A3E).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}