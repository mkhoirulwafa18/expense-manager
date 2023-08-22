import 'package:app_boilerplate/features/expenses/presentation/screen/expenses_page.dart';
import 'package:app_boilerplate/features/home/presentation/screen/home_page.dart';
import 'package:app_boilerplate/features/statistic/presentation/screen/statistic_page.dart';
import 'package:app_boilerplate/shared/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
  }

  List<Widget> _buildScreens() {
    return const [HomePage(), StatisticPage(), ExpensesPage()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) => [
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'assets/home.svg',
            // ignore: deprecated_member_use
            color: Theme.of(context).colorScheme.primary,
          ),
          inactiveIcon: SvgPicture.asset('assets/home.svg'),
          activeColorPrimary: Theme.of(context).colorScheme.primary,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'assets/statistic.svg',
            // ignore: deprecated_member_use
            color: Theme.of(context).colorScheme.primary,
          ),
          inactiveIcon: SvgPicture.asset('assets/statistic.svg'),
          activeColorPrimary: Theme.of(context).colorScheme.primary,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'assets/dollar.svg',
            // ignore: deprecated_member_use
            color: Theme.of(context).colorScheme.primary,
          ),
          inactiveIcon: SvgPicture.asset('assets/dollar.svg'),
          activeColorPrimary: Theme.of(context).colorScheme.primary,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(context),
        backgroundColor: Theme.of(context).colorScheme.background,
        resizeToAvoidBottomInset: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10),
          colorBehindNavBar: Theme.of(context).colorScheme.background,
        ),
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
        ),
        navBarStyle: NavBarStyle.style14,
      ),
    );
  }
}
