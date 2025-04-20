import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryWhite,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.notoSansJavanese(
        color: AppColors.primaryBlack,
        fontSize: 38.sp,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.notoSansJavanese(
        color: AppColors.primaryBlack,
        fontSize: 15.sp,
        fontWeight: FontWeight.w900,
      ),
      titleSmall: GoogleFonts.notoSansJavanese(
        color: AppColors.primaryWhite,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: AppColors.primaryBlack,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(color: AppColors.primaryWhite, fontSize: 12.sp),
      bodySmall: TextStyle(color: AppColors.grey, fontSize: 14.sp),
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //controls the status bar color
        statusBarIconBrightness:
            Brightness.dark, //control the status bar icons color
      ),
      backgroundColor: Colors.transparent,
    ),

    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColors.primaryWhite,
      shape: CircularNotchedRectangle(),
      elevation: 20,
    ),
  );
}
