import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/components/breaking_category_card.dart';
import 'package:news_app/models/breaking_news_model.dart';
import 'package:news_app/service/news_service.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BreakingCategoryCardList extends StatefulWidget {
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
  State<BreakingCategoryCardList> createState() =>
      _BreakingCategoryCardListState();
}

class _BreakingCategoryCardListState extends State<BreakingCategoryCardList> {
  List<BreakingNewsModel> breakingNews = [];
  bool dataHere = false;
  @override
  void initState() {
    callGetBreakingNews();
    super.initState();
  }

  callGetBreakingNews() async {
    breakingNews = await NewsService.getBreakingNews(q: 'trend');
    setState(() {
      dataHere = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return dataHere
        ? SizedBox(
          width: widget.width,
          height: widget.height * 0.28,
          child: PageView.builder(
            controller: widget.controller,
            itemCount: breakingNews.length,
            itemBuilder: (context, index) {
              return BreakingCategoryCard(
                index: index,
                breakingNewsModel: breakingNews[index],
                height: widget.height,
                width: widget.width,
              );
            },
          ),
        )
        : Skeletonizer(
          enabled: true,
          child: SizedBox(
            width: widget.width,
            height: widget.height * 0.28,
            child: PageView.builder(
              controller: widget.controller,
              itemCount: breakingNews.length,
              itemBuilder: (context, index) {
                return BreakingCategoryCard(
                  index: index,
                  breakingNewsModel: breakingNews[index],
                  height: widget.height,
                  width: widget.width,
                );
              },
            ),
          ),
        );
  }
}
