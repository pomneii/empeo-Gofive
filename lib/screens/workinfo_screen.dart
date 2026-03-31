import 'package:flutter/material.dart';

class WorkInfoScreen extends StatelessWidget {
  const WorkInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Work Info",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}