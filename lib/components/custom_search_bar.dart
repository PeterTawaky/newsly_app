import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/constants/app_colors.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
        color: AppColors.primaryBlack,
        fontWeight: FontWeight.w500,
      ), // لون النص

      decoration: InputDecoration(
        suffixIcon: Icon(FontAwesomeIcons.sliders, color: AppColors.grey),
        hintText: 'Search',

        hintStyle: Theme.of(context).textTheme.bodySmall,
        filled: true,
        fillColor: AppColors.lightWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(Icons.search, color: AppColors.grey),
      ),
    );
  }
}
