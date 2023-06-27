import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final int index;
  final Color? backgroundColor;
  const Tile({super.key, required this.index, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
    );
  }
}
