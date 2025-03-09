import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/components/news_tile.dart';
import 'package:news_app/core/api/endpoints.dart';
import 'package:news_app/models/breaking_news_model.dart';
import 'package:news_app/repositories/news_repository.dart';

class NewsTileList extends StatefulWidget {
  final String endPoint;
  final String q;
  const NewsTileList({super.key, required this.endPoint, required this.q});

  @override
  State<NewsTileList> createState() => _NewsTileListState();
}

class _NewsTileListState extends State<NewsTileList> {
  var futureData;
  @override
  void initState() {
    futureData = NewsRepository().getNews(
      widget.endPoint,
      queryParameters: {
        ApiKey.q: widget.q,
        ApiKey.apiKey: 'fde5a16a615f45978a05b8593dba9ed6',
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: FutureBuilder<List<NewsModel>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                return NewsTile(breakingNewsModel: snapshot.data![index]);
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
