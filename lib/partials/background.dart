import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ClipRect(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.deepPurpleAccent],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurpleAccent, Colors.red],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
