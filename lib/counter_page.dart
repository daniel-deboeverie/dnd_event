import 'package:dnd_event/partials/adventurer_fight_scene.dart';
import 'package:dnd_event/partials/background.dart';
import 'package:dnd_event/partials/monster_count.dart';
import 'package:dnd_event/partials/monster_fight_scene.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Background()),
          Positioned.fill(
            child: Column(
              children: [
                Expanded(child: MonsterCount()),
                Row(
                  children: [
                    Expanded(child: MonsterFightScene()),
                    Expanded(child: AdventurerFightScene()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
