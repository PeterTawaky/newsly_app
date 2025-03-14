import 'package:go_router/go_router.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/layout/main_layout.dart';
import 'package:news_app/screens/news_details_screen.dart';
import 'package:news_app/screens/route_error_screen.dart';
import 'package:news_app/screens/view_all_screens.dart';

class RouterGenerator {
  static GoRouter mainRouting = GoRouter(
    initialLocation: AppRoutes.mainLayout,
    errorBuilder: (context, state) {
      return RouteErrorScreen();
    },

    routes: [
      GoRoute(
        name: AppRoutes.mainLayout,
        path: AppRoutes.mainLayout,
        builder: (context, state) {
          return MainLayout();
        },
      ),
      GoRoute(
        name: AppRoutes.viewAllScreen,
        path: AppRoutes.viewAllScreen,
        builder: (context, state) {
          return ViewAllScreens();
        },
      ),
      GoRoute(
        name: AppRoutes.NewsDetailsScreen,
        path: AppRoutes.NewsDetailsScreen,
        builder: (context, state) {
          return NewsDetailsScreen();
        },
      ),
    ],
  );
}
