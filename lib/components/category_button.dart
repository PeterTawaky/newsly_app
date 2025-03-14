import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String categoryTitle;
  const CategoryButton({
    super.key,
    required this.buttonColor,
    required this.textColor,
    required this.categoryTitle,
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
