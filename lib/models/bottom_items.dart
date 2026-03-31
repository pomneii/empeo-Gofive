import 'package:flutter/material.dart';

class BottomItems extends StatelessWidget {
  final Widget icon;
  final String title;

  const BottomItems({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 20),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}