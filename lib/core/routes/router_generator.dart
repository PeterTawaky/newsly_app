import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/logic/cubit/news_cubit.dart';
import '../../features/home/presentation/screens/news_details_screen.dart';
import '../../features/home/presentation/screens/route_error_screen.dart';
import '../../features/home/presentation/screens/view_all_screens.dart';
import '../../features/layout/home_layout.dart';
import '../api/endpoints.dart';
import 'app_routes.dart';

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
          return HomeLayout();
        },
      ),
      GoRoute(
        name: AppRoutes.viewAllScreen,
        path: AppRoutes.viewAllScreen,
        builder: (context, state) {
          return BlocProvider<NewsCubit>(
            create:
                (context) =>
                    NewsCubit()
                      ..getNews(endPoint: Endpoints.everything, q: 'all',
                      // forceRefresh: true
                      ),
            child: ViewAllScreens(),
          );
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
