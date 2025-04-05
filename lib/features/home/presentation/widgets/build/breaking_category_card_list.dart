import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/themes/app_colors.dart';
import 'package:news_app/features/home/presentation/widgets/components/breaking_category_card.dart';
import 'package:news_app/features/home/logic/cubit/news_cubit.dart';
import 'package:news_app/features/home/presentation/widgets/components/shimmer_category_card.dart';
import 'package:shimmer/shimmer.dart';

class BreakingCategoryCardList extends StatelessWidget {
  const BreakingCategoryCardList({
    super.key,
    required this.controller,
    required this.height,
    required this.width,
  });

  final PageController controller;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          return SizedBox(
            width: width,
            height: height * 0.28,
            child: PageView.builder(
              controller: controller,
              itemCount: state.newsList.length,
              itemBuilder: (context, index) {
                return BreakingCategoryCard(
                  index: index,
                  breakingNewsModel: state.newsList[index],
                  height: height,
                  width: width,
                );
              },
            ),
          );
        } else {
          return SizedBox(
            width: width,
            height: height * 0.28,
            child: PageView.builder(
              controller: controller,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ShimmerCategoryCard(height: height);
              },
            ),
          );
          // Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
