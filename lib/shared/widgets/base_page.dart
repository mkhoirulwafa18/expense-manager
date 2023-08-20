import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class BasePage extends StatelessWidget {
  const BasePage({
    required this.appBarTitle,
    required this.body,
    this.floatingActionButton,
    super.key,
  }) : padding = const EdgeInsets.all(kSpacingMedium);

  const BasePage.noPadding({
    required this.appBarTitle,
    required this.body,
    this.floatingActionButton,
    super.key,
  }) : padding = EdgeInsets.zero;

  final String appBarTitle;
  final Widget body;
  final Widget? floatingActionButton;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(appBarTitle),
        titleTextStyle: theme.textTheme.displaySmall,
        backgroundColor: theme.colorScheme.background,
        iconTheme: IconThemeData(color: theme.colorScheme.onBackground),
        elevation: 2,
        centerTitle: true,
      ),
      body: Padding(
        padding: padding,
        child: body,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
