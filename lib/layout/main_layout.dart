import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/components/special_circle_icon.dart';
import 'package:news_app/constants/app_colors.dart';
import 'package:news_app/functions/bottom_ellipse.dart';
import 'package:news_app/screens/bookmark_screen.dart';
import 'package:news_app/screens/explore_screen.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/profile_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

//function to change the index
class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //function to build the navigation item
  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: ConditionalBuilder(
        condition: _selectedIndex == index,
        builder:
            (context) => Container(
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(40),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              child: Row(
                children: [
                  Icon(icon, size: 30.sp, color: AppColors.primaryWhite),
                  SizedBox(width: 8), // المسافة بين الأيقونة والنص
                  Text(
                    label,
                    style: TextStyle(
                      color: AppColors.primaryWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
        fallback:
            (context) => Icon(
              icon,
              size: 30.sp,
              color: _selectedIndex == index ? Colors.blue : Colors.grey,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    List<Widget> screens = [
      HomeScreen(),
      ExploreScreen(),
      BookmarkScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      key: scaffoldKey, //create this key to open the drawer through it
      bottomNavigationBar: BottomAppBar(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, "Home", 0),
                _buildNavItem(Icons.explore, "Explore", 1),
                _buildNavItem(Icons.bookmark_border_outlined, "Bookmark", 2),
                _buildNavItem(Icons.person_2_outlined, "Profile", 3),
              ],
            ),
          ],
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text('Home')),
            ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
          ],
        ),
      ),
      appBar: AppBar(
        leading: SpecialCircleIcon(
          onTap: () => scaffoldKey.currentState!.openDrawer(),
          icon: Icons.menu,
          iconColor: AppColors.primaryBlack,
        ),
        actions: [
          SpecialCircleIcon(
            icon: Icons.search,
            iconColor: AppColors.primaryBlack,
            onTap: () {},
          ),
          SpecialCircleIcon(
            icon: Icons.notification_add_rounded,
            iconColor: AppColors.primaryBlack,
            onTap: () {},
          ),
        ],
      ),
      body: screens.elementAt(_selectedIndex),
    );
  }
}
