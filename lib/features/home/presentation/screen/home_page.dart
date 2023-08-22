import 'package:app_boilerplate/features/home/home.dart';
import 'package:app_boilerplate/features/home/presentation/provider/transactions_provider.dart';
import 'package:app_boilerplate/l10n/l10n.dart';
import 'package:app_boilerplate/shared/theme/app_theme.dart';
import 'package:app_boilerplate/shared/widgets/base_page.dart';
import 'package:app_boilerplate/shared/widgets/section.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final recordedTrx = ref.watch(recordedTrxProvider);
    final transactions = ref.watch(transactionsProvider);
    final theme = Theme.of(context);
    return BasePage(
      appBarTitle: l10n.home,
      actions: [
        IconButton.filled(
          onPressed: () => ref.read(appThemeProvider.notifier).toggleTheme(),
          icon: const Icon(Icons.sunny),
        ),
      ],
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // =====BALANCE SECTION=====
            Section(
              titleSection: 'Your Balance',
              subtitleSection: r'$6,420.97',
              action: const Icon(Icons.more_vert),
              content: SizedBox(
                height: 180,
                child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              index == 0
                                  ? 'assets/card.png'
                                  : 'assets/card2.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: MediaQuery.of(context).size.width / 1.3,
                        height: 200,
                        // child: Text(index.toString()),
                      ),
                    );
                  },
                ),
              ),
            ),
            // =====END BALANCE SECTION=====
            const SizedBox(
              height: 20,
            ),
            // =====START RECORDED TRANSACTION SECTION=====
            Section(
              titleSection: 'My Recorded Transactions',
              action: const Icon(Icons.add),
              content: SizedBox(
                height: 80,
                child: ListView.builder(
                  itemCount: recordedTrx.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2.6,
                        height: 100,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(recordedTrx[index].title),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                ),
                              ],
                            ),
                            const Divider(),
                            Text('Recent', style: theme.textTheme.bodySmall),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '\$${recordedTrx[index].total}',
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // =====END RECORDED TRANSACTION SECTION=====
            const SizedBox(
              height: 20,
            ),
            // =====START ALL TRANSACTION SECTION=====
            Section(
              titleSection: 'All Transactions',
              // actionIcon: Icons.add,
              content: ListView.builder(
                itemCount: transactions.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 2.6,
                    height: 80,
                    child: Card(
                      elevation: 1,
                      child: ListTile(
                        title: Text(transactions[index].name),
                        subtitle: Text('\$${transactions[index].amount}'),
                        leading: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffF3F3F7),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              transactions[index].icon,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                        trailing: const Icon(Icons.more_vert),
                      ),
                    ),
                  );
                },
              ),
            ),
            // =====END ALL TRANSACTION SECTION=====
          ],
        ),
      ),
    );
  }
}
