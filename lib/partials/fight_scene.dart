import 'package:dnd_event/partials/animated_fighting_gif.dart';
import 'package:flutter/material.dart';

class FightScene extends StatelessWidget {
  const FightScene({
    required this.assetKeyFirstFighter,
    required this.assetKeySecondFighter,
    required this.assetKeyThirdFighter,
    required this.assetKeyFourthFighter,
    required this.flipped,
    required this.dead,
    super.key,
  });

  final String assetKeyFirstFighter;
  final String assetKeySecondFighter;
  final String assetKeyThirdFighter;
  final String assetKeyFourthFighter;
  final bool flipped;
  final bool dead;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          Expanded(
            child: AnimatedFightingGif(
              assetKey: assetKeyFirstFighter,
              dead: dead,
              flip: flipped,
            ),
          ),
          Expanded(
            child: AnimatedFightingGif(
              assetKey: assetKeySecondFighter,
              dead: dead,
              flip: flipped,
            ),
          ),
          Expanded(
            child: AnimatedFightingGif(
              assetKey: assetKeyThirdFighter,
              dead: dead,
              flip: flipped,
            ),
          ),
          Expanded(
            child: AnimatedFightingGif(
              assetKey: assetKeyFourthFighter,
              dead: dead,
              flip: flipped,
            ),
          ),
        ],
      ),
    );
  }
}
