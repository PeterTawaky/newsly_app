import 'package:flutter/material.dart';
import 'package:news_app/constants/app_colors.dart';

class RouteErrorScreen extends StatelessWidget {
  const RouteErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'No Router for this app',
          style: TextStyle(color: AppColors.primaryBlack, fontSize: 20),
        ),
      ),
    );
  }
}
