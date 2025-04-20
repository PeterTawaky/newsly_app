import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/theme/app_theme_data.dart';
import 'package:provider/provider.dart';

import 'bloc_observer.dart';
import 'core/dependencies/di_container.dart';
import 'core/routes/router_generator.dart';
import 'core/utils/theme/app_colors.dart';
import 'features/home/logic/provider/bottom_nav_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupDI(); //initialize the dependency injection
  await dotenv.load(fileName: ".env"); //load the env file
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]); //lock orientation

  runApp(
    ChangeNotifierProvider<BottomNavProvider>(
      create: (context) => BottomNavProvider(),
      child: Newsaily(),
    ),
  );
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
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}
