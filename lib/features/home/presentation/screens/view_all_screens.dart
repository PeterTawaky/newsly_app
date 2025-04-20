import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../logic/provider/category_provider.dart';
import '../widgets/build/build_categories_list.dart';
import '../widgets/build/news_tile_list.dart';
import '../widgets/components/custom_search_bar.dart';
import '../widgets/components/special_circle_icon.dart';
import '../../../../core/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class ViewAllScreens extends StatelessWidget {
  const ViewAllScreens({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> categories = [
      'All',
      'Animals',
      'Business',
      'Entertainment',
      'General',
      'Health',
      'Science',
      'Sports',
      'Technology',
    ];
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false, //to hide the default back button
        leading: SpecialCircleIcon(
          icon: Icons.arrow_back_ios,
          iconColor: AppColors.primaryBlack,
          onTap: context.pop,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: CustomScrollView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                'Discover',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'News from all around the world',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(child: CustomSearchBar()),

            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            ChangeNotifierProvider<CategoryProvider>(
              create: (context) => CategoryProvider(),
              child: SliverToBoxAdapter(
                child: BuildCategoriesList(categories: categories),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            NewsTileList(),
          ],
        ),
      ),
    );
  }
}
