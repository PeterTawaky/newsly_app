import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/components/breaking_category_card_list.dart';
import 'package:news_app/components/news_tile_list.dart';
import 'package:news_app/components/page_slider_indicator.dart';
import 'package:news_app/components/title_row_head.dart';

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
    
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleRowHead(mainTitle: 'Breaking News'),
          SizedBox(height: 4.h),
          BreakingCategoryCardList(
            controller: controller,
            height: height,
            width: width,
          ),
          SizedBox(height: 12.h),
          PageSliderIndicator(controller: controller, length: 6),
          TitleRowHead(mainTitle: 'Recommendation'),
          SizedBox(height: 8.h),

          NewsTileList(),
        ],
      ),
    );
  }
}
