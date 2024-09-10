import 'package:dnd_event/hooks/use_get_adventure_count.dart';
import 'package:dnd_event/hooks/use_get_adventures_dead.dart';
import 'package:dnd_event/partials/fight_scene.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdventurersCount extends HookConsumerWidget {
  const AdventurersCount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adventurersCount = useGetAdventureCount(ref);
    final adventurersDead = useGetAdventurersDead(ref);

    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Adventurers',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '$adventurersCount',
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
        ),
        FightScene(
          assetKeyFirstFighter: '',
          assetKeySecondFighter: 'wizard',
          assetKeyThirdFighter: '',
          assetKeyFourthFighter: '',
          flipped: true,
          dead: adventurersDead,
        ),
      ],
    );
  }
}
