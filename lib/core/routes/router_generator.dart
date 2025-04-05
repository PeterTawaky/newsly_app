import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/api/endpoints.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/features/home/logic/cubit/news_cubit.dart';
import 'package:news_app/features/layout/home_layout.dart';
import 'package:news_app/features/home/presentation/screens/news_details_screen.dart';
import 'package:news_app/features/home/presentation/screens/route_error_screen.dart';
import 'package:news_app/features/home/presentation/screens/view_all_screens.dart';

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
            create: (context) => NewsCubit()..getNews(endPoint: Endpoints.everything, q: 'all'),
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
