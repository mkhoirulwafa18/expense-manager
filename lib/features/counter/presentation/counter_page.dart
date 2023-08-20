import 'package:app_boilerplate/features/counter/counter.dart';
import 'package:app_boilerplate/l10n/l10n.dart';
import 'package:app_boilerplate/routes/app_route.dart';
import 'package:app_boilerplate/shared/theme/app_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final counter = ref.watch(counterProvider);
    final router = context.router;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$counter', style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
            onPressed: () => ref.read(appThemeProvider.notifier).toggleTheme(),
            icon: const Icon(Icons.sunny),
            label: const Text('toggle'),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
            onPressed: () => router.push(const SecondRoute()),
            icon: const Icon(Icons.arrow_circle_right),
            label: const Text('second page'),
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'plus',
            onPressed: () => ref.read(counterProvider.notifier).increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'minus',
            onPressed: () => ref.read(counterProvider.notifier).decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
