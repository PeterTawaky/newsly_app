import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/app_colors.dart';
import 'package:news_app/functions/remove_text_response.dart';
import 'package:news_app/models/breaking_news_model.dart';

class NewsTile extends StatelessWidget {
  final NewsModel breakingNewsModel;
  const NewsTile({super.key, required this.breakingNewsModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 110.h,
            width: 110.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: CachedNetworkImage(
              // height: height * 0.28,
              // width: width,
              imageUrl:
                  breakingNewsModel.urlToImage ??
                  'https://static.vecteezy.com/system/resources/previews/009/381/293/original/prohibition-sign-clipart-design-illustration-free-png.png',
              // placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  breakingNewsModel.name!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  breakingNewsModel.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Row(
                  spacing: 2.w,
                  children: [
                    Text(
                      getFirstTwoWords(breakingNewsModel.author) ?? 'Unknown',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    CircleAvatar(radius: 4.r, backgroundColor: AppColors.grey),
                    Text(
                      'Feb 27, 2023',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
