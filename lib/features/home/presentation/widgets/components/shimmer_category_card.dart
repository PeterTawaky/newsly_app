import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/themes/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategoryCard extends StatelessWidget {
  const ShimmerCategoryCard({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: height * 0.28,
      child: Shimmer.fromColors(
        baseColor:AppColors.shimmerGrey,
        highlightColor: AppColors.primaryWhite,
        child: Container(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color:AppColors.shimmerGrey,
            borderRadius: BorderRadius.circular(22),
          ),
        ),
      ),
    );
  }
}
