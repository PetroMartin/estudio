import 'package:flutter/material.dart';

class IconButtonWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isActive;
  final VoidCallback onPressed;

  IconButtonWithText({
    required this.icon,
    required this.text,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, color: isActive ? Colors.yellow : Colors.white),
          onPressed: onPressed,
        ),
        Text(
          text,
          style: TextStyle(color: isActive ? Colors.yellow : Colors.white),
        ),
      ],
    );
  }
}
