import 'package:dnd_event/partials/adventurers_count.dart';
import 'package:dnd_event/partials/monster_count.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Expanded(child: MonsterCount()),
          SizedBox(
            width: 50,
            child: Placeholder(),
          ),
          Expanded(child: AdventurersCount()),
        ],
      ),
    );
  }
}
