import 'package:dnd_event/hooks/use_get_monster_count.dart';
import 'package:dnd_event/hooks/use_get_monsters_dead.dart';
import 'package:dnd_event/partials/fight_scene.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MonsterCount extends HookConsumerWidget {
  const MonsterCount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monsterCount = useGetMonsterCount(ref);
    final monsterDead = useGetMonstersDead(ref);

    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Monsters',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '$monsterCount',
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
        ),
        FightScene(
          assetKeyFirstFighter: '',
          assetKeySecondFighter: '',
          assetKeyThirdFighter: '',
          assetKeyFourthFighter: '',
          flipped: false,
          dead: monsterDead,
        ),
      ],
    );
  }
}
