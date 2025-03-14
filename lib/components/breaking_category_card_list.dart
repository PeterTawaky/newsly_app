import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/components/breaking_category_card.dart';
import 'package:news_app/core/api/endpoints.dart';
import 'package:news_app/core/errors/exceptions.dart';
import 'package:news_app/repositories/news_repository.dart';
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
  dynamic breakingNews = [];
  bool dataHere = false;
  @override
  void initState() {
    callGetBreakingNews();
    super.initState();
  }

  callGetBreakingNews() async {
    try {
      breakingNews = await NewsRepository().getNews(
        Endpoints.topHeadlines,
        queryParameters: {
          ApiKey.apiKey: 'fde5a16a615f45978a05b8593dba9ed6',
          ApiKey.q: 'trend',
        },
      );
      setState(() {
        dataHere = true;
      });
    } on ServerException catch (e) {
      log(e.errorModel.message);
    }
    // await NewsService.getBreakingNews(q: 'trend');
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
