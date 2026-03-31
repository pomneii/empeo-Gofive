import 'package:flutter/material.dart';

class ModalbottomWidget extends StatelessWidget {
  final Widget icon;
  final String title;

  const ModalbottomWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 15),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}