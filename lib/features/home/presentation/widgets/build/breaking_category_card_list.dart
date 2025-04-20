import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/breaking_category_card.dart';
import '../../../logic/cubit/news_cubit.dart';
import '../components/shimmer_category_card.dart';

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
      bloc: BlocProvider.of<NewsCubit>(context),
      buildWhen: (previousState, currentState) => previousState != currentState,
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
        } else if (state is NewsError) {
          return Text(state.errorMessage);
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
