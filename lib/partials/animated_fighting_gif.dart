import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum Poses { attack1, attack2, dying, dead }

class AnimatedFightingGif extends HookWidget {
  const AnimatedFightingGif({
    required this.assetKey,
    required this.dead,
    this.flip = false,
    super.key,
  });

  final String assetKey;
  final bool dead;
  final bool flip;

  @override
  Widget build(BuildContext context) {
    //TODO remove
    if (assetKey.isEmpty) {
      return const Placeholder();
    }

    final timer = useState<Timer?>(null);
    final activePose = useState(Poses.attack1);

    useEffect(
      () {
        timer.value?.cancel();

        if (dead) {
          activePose.value = Poses.dying;
          timer.value = Timer(
            const Duration(seconds: 2),
            () => activePose.value = Poses.dead,
          );
        } else {
          activePose.value = Poses.attack1;
          timer.value = Timer.periodic(const Duration(seconds: 2), (_) {
            if (activePose.value == Poses.attack1) {
              activePose.value = Poses.attack2;
            } else {
              activePose.value = Poses.attack1;
            }
          });
        }

        return null;
      },
      [dead],
    );

    useEffect(
      () {
        return () => timer.value?.cancel();
      },
      [],
    );

    String getAssetName(Poses pose) => switch (pose) {
          Poses.attack1 => 'assets/${assetKey}_attack_1.png',
          Poses.attack2 => 'assets/${assetKey}_attack_2.png',
          Poses.dying => 'assets/${assetKey}_dying.png',
          Poses.dead => 'assets/${assetKey}_dead.png',
        };

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: flip
          ? Transform(
              key: ValueKey<Poses>(activePose.value),
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Image.asset(
                getAssetName(activePose.value),
              ),
            )
          : Image.asset(
              getAssetName(activePose.value),
              key: ValueKey<Poses>(activePose.value),
            ),
    );
  }
}
