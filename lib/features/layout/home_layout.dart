import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/logic/provider/bottom_nav_provider.dart';
import 'package:news_app/features/home/presentation/widgets/components/special_circle_icon.dart';
import 'package:news_app/core/themes/app_colors.dart';
import 'package:news_app/features/home/presentation/screens/bookmark_screen.dart';
import 'package:news_app/features/home/presentation/screens/explore_screen.dart';
import 'package:news_app/features/home/presentation/screens/home_screen.dart';
import 'package:news_app/features/home/presentation/screens/profile_screen.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

//function to change the index
class _HomeLayoutState extends State<HomeLayout> {
  // int _selectedIndex = 0;

  //function to build the navigation item
  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => context.read<BottomNavProvider>().navigate(index),
      child: ConditionalBuilder(
        condition: context.watch<BottomNavProvider>().currentIndex == index,
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
              color:
                  context.watch<BottomNavProvider>().currentIndex == index
                      ? Colors.blue
                      : Colors.grey,
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
      body: Consumer(builder: (context, watch, child) {
        return screens.elementAt(context.watch<BottomNavProvider>().currentIndex);
      }),
    );
  }
}
