import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/api/endpoints.dart';
import '../../logic/cubit/news_cubit.dart';
import '../widgets/build/breaking_category_card_list.dart';
import '../widgets/build/news_tile_list.dart';
import '../widgets/components/page_slider_indicator.dart';
import '../widgets/sections/title_row_head.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final controller = PageController(
      viewportFraction: 0.9,
      keepPage: true,
    ); //this setting will make sure that many pages can be visible at a time

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: TitleRowHead(mainTitle: 'Breaking News')),

        SliverToBoxAdapter(child: SizedBox(height: 4.h)),
        BlocProvider<NewsCubit>(
          create:
              (context) =>
                  NewsCubit()
                    ..getNews(endPoint: Endpoints.topHeadlines, q: 'trend'),
          child: SliverToBoxAdapter(
            child: BreakingCategoryCardList(
              controller: controller,
              height: height,
              width: width,
            ),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 12.h)),
        SliverToBoxAdapter(
          child: Center(
            child: PageSliderIndicator(controller: controller, length: 6),
          ),
        ),
        SliverToBoxAdapter(child: TitleRowHead(mainTitle: 'Recommendation')),

        SliverToBoxAdapter(child: SizedBox(height: 8.h)),

        BlocProvider<NewsCubit>(
          create:
              (context) =>
                  NewsCubit()
                    ..getNews(endPoint: Endpoints.everything, q: 'recommend'),
          child: NewsTileList(),
        ),
      ],
    );
  }
}
