import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_color.dart';
MaterialColor swatchColor = const MaterialColor(
  0xFF002A3E, // The primary value of the color, which is black in this case
  <int, Color>{
    50: Color(0xFF002A3E), // You can define shades of black if needed
    100: Color(0xFF002A3E),
    200: Color(0xFF002A3E),
    300: Color(0xFF002A3E),
    400: Color(0xFF002A3E),
    500: Color(0xFF002A3E),
    600: Color(0xFF002A3E),
    700: Color(0xFF002A3E),
    800: Color(0xFF002A3E),
    900: Color(0xFF002A3E),
  },
);

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.myWhite,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: AppColors.myWhite,
    titleTextStyle: GoogleFonts.almarai(
      textStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.myDark,
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.myGrey,
      size: 20.r,
    ),
  ),
  textTheme: TextTheme(
    //ToDo//textStyle type sort
    //  bodySmall
    //  bodyMedium
    //  bodyLarge
    //  displaySmall
    //  displayMedium
    //  displayLarge
    //  titleSmall
    //  titleMedium
    //  titleLarge
    //  headlineSmall
    //  headlineMedium
    //  headlineLarge
    labelMedium: GoogleFonts.adamina(
      textStyle: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.myWhite,
      ),
    ),
    labelSmall:GoogleFonts.adamina(
      textStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.myGrey,
      ),
    ),
    labelLarge: GoogleFonts.adamina(
      textStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.myDark,
      ),
    ),
    bodySmall: GoogleFonts.alef(
      textStyle: TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.myDark,
      ),
    ),
    bodyMedium: GoogleFonts.pottaOne(
      textStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.myDark,
      ),
    ),
    bodyLarge:GoogleFonts.notoKufiArabic(
      textStyle: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.myDark,
      ),
    ),
    displaySmall: GoogleFonts.almarai(
      textStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.myDark,
      ),
    ),
    displayMedium: GoogleFonts.aDLaMDisplay(
      textStyle: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryColor,
      ),
    ),
    displayLarge:GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.myWhite,
      ),
    ),
    titleSmall: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.myDark,
      ),
    ),
    titleLarge: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
    ),
    headlineSmall: GoogleFonts.almarai(
      textStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.myDark,
      ),
    ),
    headlineMedium: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
    ),
    headlineLarge: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 25.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.myDark,
      ),
    ),
  ), colorScheme: ColorScheme.fromSwatch(primarySwatch: swatchColor).copyWith(surface: AppColors.myWhite),
  // textButtonTheme: TextButtonThemeData(
  //   style: ButtonStyle(
  //       foregroundColor:
  //       MaterialStateProperty.all<Color>(AppColors.myDark),
  //       textStyle: MaterialStateProperty.all<TextStyle>(GoogleFonts.plusJakartaSans(
  //         fontSize: 14,
  //         color: AppColors.myDark,
  //         fontWeight: FontWeight.bold,
  //       ))),
  // ),
  // iconTheme: IconThemeData(
  //   color: AppColors.myGrey,
  //   size: 20.r,
  // ),
  // bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //   // backgroundColor: AppColors.myWhite,
  //   //   elevation: 5,
  //   unselectedIconTheme: IconThemeData(
  //     size: 14.r,
  //   ),
  //   selectedIconTheme: IconThemeData(
  //     size: 14.r,
  //   ),
  //   //   unselectedIconTheme: IconThemeData(
  //   //     color: AppColors.colorIconButtonNavBar,
  //   //     size: 20,
  //   //   ),
  //   elevation: 8,
  //   selectedItemColor: AppColors.primaryColor,
  //   selectedLabelStyle: GoogleFonts.plusJakartaSans(
  //     fontSize: 12.sp,
  //     fontWeight: FontWeight.w400,
  //     color: AppColors.primaryColor,
  //
  //   ),
  //   unselectedLabelStyle: GoogleFonts.plusJakartaSans(
  //     fontSize: 12.sp,
  //     fontWeight: FontWeight.w400,
  //     color: AppColors.dotBackground,
  //   ),
  //   unselectedItemColor: AppColors.dotBackground,
  //
  // ),

  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ButtonStyle(
  //     shape: MaterialStateProperty.resolveWith((_) {
  //       return RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(
  //           16.r,
  //         ),
  //       );
  //     }),
  //     animationDuration: const Duration(milliseconds: 2000),
  //     overlayColor: MaterialStateProperty.resolveWith(
  //             (states) => AppColors.primaryColor),
  //
  //     foregroundColor: MaterialStateProperty.resolveWith((states) {
  //       return AppColors.myWhite;
  //     }),
  //     backgroundColor: MaterialStateProperty.resolveWith((states) {
  //       if (states.contains(MaterialState.pressed)) {
  //         return AppColors.primaryColor;
  //       }
  //       return AppColors.primaryColor;
  //     }),
  //   ),
  // ),
);

