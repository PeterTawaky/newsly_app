import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/components/news_tile.dart';
import 'package:news_app/models/breaking_news_model.dart';
import 'package:news_app/service/news_service.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NewsTileList extends StatefulWidget {
  const NewsTileList({super.key});

  @override
  State<NewsTileList> createState() => _NewsTileListState();
}

class _NewsTileListState extends State<NewsTileList> {
  var futureData;
  @override
  void initState() {
    futureData = NewsService.getBreakingNews(q: 'recommend');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: FutureBuilder<List<BreakingNewsModel>>(
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
