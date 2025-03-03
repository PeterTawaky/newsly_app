import 'package:flutter/widgets.dart';
import 'package:news_app/constants/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageSliderIndicator extends StatelessWidget {
  const PageSliderIndicator({
    super.key,
    required this.controller,
    required this.length,
  });

  final PageController controller;
  final int length;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: length,
      effect: ExpandingDotsEffect(
        spacing: 8.0,
        radius: 16.0,
        dotWidth: 10.0,
        dotHeight: 10.0,
        strokeWidth: 1.5,
        dotColor: AppColors.lightWhite,
        activeDotColor: AppColors.blue,
      ),
    );
  }
}

