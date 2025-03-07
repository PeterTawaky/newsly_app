import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/routes/router_generator.dart';
import 'package:news_app/constants/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]); //lock orientation

  runApp(Newsaily());
}

class Newsaily extends StatelessWidget {
  const Newsaily({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        360,
        690,
      ), //the size of screen that designer work on it on figma
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: RouterGenerator.mainRouting,
          theme: ThemeData(
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
              bodyMedium: TextStyle(
                color: AppColors.primaryWhite,
                fontSize: 12.sp,
              ),
              bodySmall: TextStyle(color: AppColors.grey, fontSize: 14.sp),
            ),
            appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor:
                    Colors.transparent, //controls the status bar color
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
          ),
        );
      },
    );
  }
}
