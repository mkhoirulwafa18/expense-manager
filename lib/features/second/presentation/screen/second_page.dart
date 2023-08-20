import 'package:app_boilerplate/shared/widgets/base_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(appBarTitle: 'Second Page', body: Placeholder());
  }
}
