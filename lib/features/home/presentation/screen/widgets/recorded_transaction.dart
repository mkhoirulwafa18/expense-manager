import 'package:app_boilerplate/features/home/presentation/provider/recorded_trx_provider.dart';
import 'package:app_boilerplate/l10n/l10n.dart';
import 'package:app_boilerplate/shared/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordedTrx extends ConsumerWidget {
  const RecordedTrx({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final recordedTrx = ref.watch(recordedTrxProvider);

    return Section(
      titleSection: l10n.myRecordedTrx,
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
                    Text(l10n.recent, style: theme.textTheme.bodySmall),
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
            ).animate(delay: (400 * index).ms).fade(duration: 400.ms).move(
                  begin: const Offset(20, 0),
                  curve: Curves.fastOutSlowIn,
                  delay: 500.ms,
                );
          },
        ),
      ),
    );
  }
}
