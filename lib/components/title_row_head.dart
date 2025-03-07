import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/constants/app_colors.dart';
import 'package:news_app/routes/app_routes.dart';

class TitleRowHead extends StatelessWidget {
  final String mainTitle;
  const TitleRowHead({super.key, required this.mainTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(mainTitle, style: Theme.of(context).textTheme.headlineMedium),
          TextButton(
            child: Text(
              'View all',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.blue),
            ),
            onPressed: () {
              context.pushNamed(AppRoutes.viewAllScreen);
            },
          ),
        ],
      ),
    );
  }
}
