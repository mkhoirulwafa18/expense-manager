import 'package:app_boilerplate/l10n/l10n.dart';
import 'package:app_boilerplate/shared/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CardBalance extends StatelessWidget {
  const CardBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      titleSection: context.l10n.yourBalance,
      subtitleSection: r'$6,420.97',
      action: const Icon(Icons.more_vert),
      content: SizedBox(
        height: 180,
        child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      index == 0 ? 'assets/card.png' : 'assets/card2.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width / 1.3,
                height: 200,
                // child: Text(index.toString()),
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
