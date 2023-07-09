import 'package:go_router/go_router.dart';
import 'package:using_go_router/src/features/feed_setting/feed_setting_page.dart';
import 'package:using_go_router/src/router/router_named.dart';

import '../../home_page.dart';
import '../features/discover/discover_page.dart';
import '../features/feed/feed_page.dart';
import '../features/feed/widgets/scaffold_with_navbar.widget.dart';
import '../features/feed_detail/feed_details_page.dart';

class AppRouter {
  AppRouter._();

  static AppRouter I = AppRouter._();

  final GoRouter _router = GoRouter(
    initialLocation: RoutesNamed.home,
    routes: [
      //Single Path
      GoRoute(
        path: RoutesNamed.home,
        name: RoutesNamed.home,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: HomePage()),
      ),
      //Used with Navigation Bar to preserve states of pages
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ScaffoldWithNavBar(navigationShell),
        branches: [
          //Nested Branch (contains more than one page)
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/${RoutesNamed.feedList}',
              name: RoutesNamed.feedList,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: FeedPage()),
            ),
            GoRoute(
              path: '/${RoutesNamed.feedDetails}',
              name: RoutesNamed.feedDetails,
              pageBuilder: (context, state) => NoTransitionPage(
                  child: FeedDetailsPage(
                id: state.queryParameters['id']!,
              )),
            ),
            GoRoute(
              path: '/${RoutesNamed.feedSetting}',
              name: RoutesNamed.feedSetting,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: FeedSettingPage()),
            )
          ]),
          //Single Branch
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/${RoutesNamed.discover}',
              name: RoutesNamed.discover,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: DiscoverPage()),
            ),
          ]),
        ],
      ),
    ],
  );

  GoRouter get router => _router;
}
