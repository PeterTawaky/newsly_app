import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/components/news_tile.dart';

class NewsTileList extends StatelessWidget {
  const NewsTileList({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 10.h),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return NewsTile(images: images);
        },
      ),
    );
  }
}
