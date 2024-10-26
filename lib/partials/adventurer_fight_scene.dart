import 'package:dnd_event/hooks/use_get_adventures_dead.dart';
import 'package:dnd_event/partials/fight_scene.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdventurerFightScene extends HookConsumerWidget {
  const AdventurerFightScene({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adventurersDead = useGetAdventurersDead(ref);

    return FightScene(
      assetKeyFirstFighter: '',
      assetKeySecondFighter: 'wizard',
      assetKeyThirdFighter: '',
      assetKeyFourthFighter: '',
      flipped: true,
      dead: adventurersDead,
    );
  }
}
