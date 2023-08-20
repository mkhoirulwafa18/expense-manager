import 'package:app_boilerplate/l10n/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_stack_router.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    final mockStackRouter = MockStackRouter();
    return pumpWidget(
      ProviderScope(
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: StackRouterScope(
            controller: mockStackRouter,
            stateHash: 0,
            child: Scaffold(
              body: widget,
            ),
          ),
        ),
      ),
    );
  }
}
