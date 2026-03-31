import 'package:flutter/material.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
      ),
      child: Center(
        child: ClipOval(
          child: Image.asset(
            imageUrl,
            height: 22,
            width: 22,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
