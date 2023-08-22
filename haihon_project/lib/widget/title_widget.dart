import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: SizedBox(
        height: 50,
        width: 300,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }
}