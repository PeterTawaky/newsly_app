// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news_app/constants/app_colors.dart';

class SpecialCircleIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color circleColor;
  final VoidCallback onTap;
  const SpecialCircleIcon({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.onTap,
    this.circleColor = AppColors.lightWhite, //if not set by user put it white
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(shape: BoxShape.circle, color: circleColor),
      child: IconButton(icon: Icon(icon, color: iconColor), onPressed: onTap),
    );
  }
}
