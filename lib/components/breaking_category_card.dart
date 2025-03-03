import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/app_colors.dart';
import 'package:news_app/models/breaking_news_model.dart';

class BreakingCategoryCard extends StatelessWidget {
  const BreakingCategoryCard({
    super.key,
    required this.breakingNewsModel,
    required this.height,
    required this.width,
    required this.index,
  });
  final int index;
  final BreakingNewsModel breakingNewsModel;
  final double height;
  final double width;

  String getFirstTwoWords(String text) {
    List<String> words = text.split(' '); // Split by space
    if (words.length >= 2) {
      return '${words[0]} ${words[1]}'; // Take first two words
    } else {
      return text; // If less than two words, return the original string
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(22)),
          child: CachedNetworkImage(
            height: height * 0.28,
            width: width,
            imageUrl:
                breakingNewsModel.urlToImage ??
                'https://static.vecteezy.com/system/resources/previews/009/381/293/original/prohibition-sign-clipart-design-illustration-free-png.png',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: height * 0.02,
          left: width * 0.05,
          child: Container(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.008,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: AppColors.blue,
            ),
            child: Text(
              breakingNewsModel.author ?? 'Unknown',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        Positioned(
          left: width * 0.05,
          bottom: 20.h,
          child: SizedBox(
            width: height * 0.38,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      breakingNewsModel.name ?? 'Unknown',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(width: 4.w),
                    CircleAvatar(
                      radius: 10.r,
                      backgroundColor: AppColors.blue,
                      child: Icon(
                        Icons.check,
                        color: AppColors.primaryWhite,
                        size: 15.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    CircleAvatar(
                      radius: 4.r,
                      backgroundColor: AppColors.primaryWhite,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '6 hours ago',

                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  breakingNewsModel.title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.primaryWhite,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
