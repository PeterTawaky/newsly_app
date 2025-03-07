import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/components/category_button.dart';
import 'package:news_app/components/custom_search_bar.dart';
import 'package:news_app/components/news_tile_list.dart';
import 'package:news_app/components/special_circle_icon.dart';
import 'package:news_app/constants/app_colors.dart';

class ViewAllScreens extends StatelessWidget {
  const ViewAllScreens({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'All',
      'Business',
      'Entertainment',
      'General',
      'Health',
      'Science',
      'Sports',
      'Technology',
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //to hide the default back button
        leading: SpecialCircleIcon(
          icon: Icons.arrow_back_ios,
          iconColor: AppColors.primaryBlack,
          onTap: context.pop,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Discover', style: Theme.of(context).textTheme.titleLarge),
              Text(
                'News from all around the world',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              CustomSearchBar(),
              SizedBox(
                height: 30.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 6.w),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder:
                      (context, index) => CategoryButton(
                        buttonColor: AppColors.blue,
                        textColor: AppColors.primaryWhite,
                        categoryTitle: categories[index],
                      ),
                  itemCount: categories.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
