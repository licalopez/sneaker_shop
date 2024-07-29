import 'package:flutter/material.dart';

enum Sizes { small, medium }

class AppButton extends StatelessWidget {
  void Function()? onPressed;
  final Sizes? size;
  final String text;

  AppButton({
    super.key,
    required this.onPressed,
    this.size = Sizes.medium,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.onSurface,
        elevation: 0,
        foregroundColor: theme.surface,
        padding: size == Sizes.medium 
          ? const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 15,
          )
          : const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 20.0
          ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}