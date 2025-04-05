import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/api/endpoints.dart';
import 'package:news_app/features/home/logic/cubit/news_cubit.dart';
import 'package:news_app/features/home/logic/provider/category_provider.dart';

class CategoryButton extends StatelessWidget {
  final int index;
  final Color buttonColor;
  final Color textColor;
  final String categoryTitle;
  const CategoryButton({
    super.key,
    required this.buttonColor,
    required this.textColor,
    required this.categoryTitle,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        categoryTitle,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
