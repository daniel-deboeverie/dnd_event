import 'package:dnd_event/hooks/use_get_monsters_dead.dart';
import 'package:dnd_event/partials/fight_scene.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MonsterFightScene extends HookConsumerWidget {
  const MonsterFightScene({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monsterDead = useGetMonstersDead(ref);

    return FightScene(
      assetKeyFirstFighter: '',
      assetKeySecondFighter: '',
      assetKeyThirdFighter: '',
      assetKeyFourthFighter: '',
      flipped: false,
      dead: monsterDead,
    );
  }
}
