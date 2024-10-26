import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:dnd_event/hooks/use_get_monster_count.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MonsterCount extends HookConsumerWidget {
  const MonsterCount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monsterCount = useGetMonsterCount(ref);

    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'MONSTERS',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'FlameOn',
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedFlipCounter(
                  duration: const Duration(milliseconds: 600),
                  value: monsterCount,
                  textStyle: const TextStyle(
                    fontSize: 80,
                    fontFamily: 'FlameOn',
                    color: Colors.red,
                    fontVariations: [FontVariation.opticalSize(40)],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
