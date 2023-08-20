import 'package:auto_route/auto_route.dart';

import '../features/counter/presentation/screen/counter_page.dart';
import '../features/second/presentation/screen/second_page.dart';
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
        AutoRoute(page: CounterRoute.page, initial: true),
        AutoRoute(page: SecondRoute.page)
      ];
}
