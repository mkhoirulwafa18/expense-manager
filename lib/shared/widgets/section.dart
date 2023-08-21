import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({
    required this.content,
    required this.titleSection,
    this.subtitleSection,
    this.action,
    super.key,
  });

  final String titleSection;
  final String? subtitleSection;
  final Widget content;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        // =====START title=====
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleSection,
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (subtitleSection != null)
                  Text(
                    subtitleSection ?? '',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.grey),
                  )
                else
                  const SizedBox(),
              ],
            ),
            if (action != null) action ?? const SizedBox(),
          ],
        ),
        // =====END title=====
        const SizedBox(
          height: 16,
        ),
        // =====START content=====
        content,
        // =====END content=====
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
