import 'package:app_boilerplate/features/dashboard/presentation/screen/dashboard_page.dart';
import 'package:app_boilerplate/features/statistic/presentation/screen/statistic_page.dart';
import 'package:auto_route/auto_route.dart';

import '../features/home/presentation/screen/home_page.dart';
part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
// @override
// replaceInRouteName

  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: DashboardRoute.page,
          children: [
            AutoRoute(
              path: '',
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: 'second',
              page: StatisticRoute.page,
            ),
          ],
        ),
      ];
}
