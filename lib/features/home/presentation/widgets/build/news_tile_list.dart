import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../components/news_tile.dart';
import '../../../logic/cubit/news_cubit.dart';
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
        } else if (state is NewsError) {
          return Text(state.errorMessage);
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: SizedBox(
                  height: 110.h,
                  child: Shimmer.fromColors(
                    baseColor: AppColors.shimmerGrey,
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
        }
      },
    );
  }
}
