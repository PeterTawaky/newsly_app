import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/api/endpoints.dart';
import 'package:news_app/core/themes/app_colors.dart';
import 'package:news_app/features/home/logic/cubit/news_cubit.dart';
import 'package:news_app/features/home/logic/provider/category_provider.dart';
import 'package:news_app/features/home/presentation/widgets/components/category_button.dart';

class BuildCategoriesList extends StatelessWidget {
  final List<String> categories;
  const BuildCategoriesList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 6.w),
        scrollDirection: Axis.horizontal,
        // shrinkWrap: true,
        itemBuilder:
            (context, index) => GestureDetector(
              onTap: () {
                context.read<CategoryProvider>().changeCategory(index);
                context.read<NewsCubit>().getNews(
                  endPoint: Endpoints.everything,
                  q: categories[index],
                );
              },
              child: CategoryButton(
                index: index,
                buttonColor:
                    context.watch<CategoryProvider>().currentIndex == index
                        ? AppColors.blue
                        : AppColors.grey,
                textColor: AppColors.primaryWhite,
                categoryTitle: categories[index],
              ),
            ),
        itemCount: categories.length,
      ),
    );
  }
}
