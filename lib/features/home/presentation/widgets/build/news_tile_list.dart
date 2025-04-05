import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/themes/app_colors.dart';
import 'package:news_app/features/home/presentation/widgets/components/news_tile.dart';
import 'package:news_app/features/home/logic/cubit/news_cubit.dart';
import 'package:news_app/features/home/presentation/widgets/components/shimmer_category_card.dart';
import 'package:shimmer/shimmer.dart';

class NewsTileList extends StatelessWidget {
  const NewsTileList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: NewsTile(breakingNewsModel: state.newsList[index]),
              );
            }, childCount: state.newsList.length),
          );
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: SizedBox(
                  height: 110.h,
                  child: Shimmer.fromColors(
                    baseColor:AppColors.shimmerGrey,
                    highlightColor: AppColors.primaryWhite,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        color: AppColors.shimmerGrey,
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                ),
              );
            }, childCount: 7),
          );

          // SliverToBoxAdapter(
          //   child: Center(child: CircularProgressIndicator()),
          // );
        }
      },
    );
  }
}
