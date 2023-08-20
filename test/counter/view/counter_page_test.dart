import 'package:app_boilerplate/features/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CounterPage', () {
    testWidgets('renders Centered Text', (tester) async {
      await tester.pumpApp(const CounterPage());
      expect(find.byType(Text), findsAtLeastNWidgets(1));
    });
  });

  group('Centered Counter Text', () {
    testWidgets('update the UI when incrementing the state', (tester) async {
      await tester.pumpApp(const CounterPage());

      // The default value is `0`, as declared in our provider
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Increment the state and re-render
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // The state have properly incremented
      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);
    });

    testWidgets('update the UI when decrementing the state', (tester) async {
      await tester.pumpApp(const CounterPage());

      // The default value is `0`, as declared in our provider
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Increment the state and re-render
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      // The state have properly incremented
      expect(find.text('-1'), findsOneWidget);
      expect(find.text('0'), findsNothing);
    });
    testWidgets('the counter state is not shared between tests',
        (tester) async {
      await tester.pumpApp(const CounterPage());

      // The state is `0` once again, with no tearDown/setUp needed
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
    });
  });
}
